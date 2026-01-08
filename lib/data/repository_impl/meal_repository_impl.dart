import 'dart:async';
import 'dart:convert';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:vitameal/data/data_source/meal_local_data_source.dart';
import 'package:vitameal/data/database/database.dart';
import 'package:vitameal/data/mapper/meal_day_mapper.dart';
import 'package:vitameal/data/mapper/meal_entry_mapper.dart';
import 'package:vitameal/data/service/sync_service.dart';
import 'package:vitameal/domain/entity/meal_day_entity.dart';
import 'package:vitameal/domain/entity/meal_entry_entity.dart';
import 'package:vitameal/domain/enum/adherence_level_enum.dart';
import 'package:vitameal/domain/enum/meal_category_enum.dart';
import 'package:vitameal/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  /// 로컬 db를 기반으로 동작, 원격 db는 outbox를 통한 동기화
  MealRepositoryImpl(this._localDataSource, this._database, this._syncService);

  final MealLocalDataSource _localDataSource;
  final AppDatabase _database;
  final SyncService _syncService;
  final Uuid _uuid = const Uuid();

  /// 날짜 범위만큼 Mealday 불러오기
  @override
  Future<List<MealDayEntity>> getMealDaysByDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      return await _localDataSource.getMealDaysByDateRange(
        userId: userId,
        startDate: startDate,
        endDate: endDate,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// 해당 날짜의 Mealday 불러오기
  @override
  Future<MealDayEntity?> getMealDayByDate({
    required String userId,
    required DateTime date,
  }) async {
    try {
      return await _localDataSource.getMealDayByDate(
        userId: userId,
        date: date,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// 해당 날짜의 Mealday 불러오기 / 없으면 생성
  @override
  Future<MealDayEntity> getOrCreateMealDay({
    required String userId,
    required DateTime date,
  }) async {
    try {
      // 해당 날짜에 MealDay가 있는지 조회
      final exist = await getMealDayByDate(userId: userId, date: date);
      if (exist != null) {
        return exist;
      }

      // 없으면 생성
      final now = DateTime.now();
      final entity = MealDayEntity(
        id: _uuid.v4(),
        userId: userId,
        mealDate: date,
        adherence: null,
        needsAiRefresh: false,
        lastEntryUpdatedAt: null,
        dataVersion: 0,
        createdAt: now, // 일단 로컬시간 사용
        updatedAt: now, // 일단 로컬시간 사용
        deletedAt: null,
        latestAiSummary: null,
      );
      await _localDataSource.upsertMealDay(entity);

      // Outbox에 작업 추가
      await _addToOutbox(
        operation: 'insert',
        tableName: 'meal_days',
        recordId: entity.id,
        payload: jsonEncode(entity.toDto().toJson()),
      );
      return entity;
    } catch (e) {
      rethrow;
    }
  }

  /// 해당 날짜의 MealEntries 불러오기
  @override
  Future<List<MealEntryEntity>> getMealEntriesByMealDayId({
    required String mealDayId,
  }) async {
    try {
      return await _localDataSource.getMealEntriesByMealDayId(
        mealDayId: mealDayId,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// 해당 날짜의 목표 달성도(adherence) 수정
  @override
  Future<MealDayEntity> updateMealDayAdherence({
    required String mealDayId,
    required AdherenceLevel adherence,
  }) async {
    try {
      // 로컬 업데이트
      await _localDataSource.updateMealDayAdherence(
        mealDayId: mealDayId,
        adherence: adherence,
      );

      // Outbox에 작업 추가
      await _addToOutbox(
        operation: 'update',
        tableName: 'meal_days',
        recordId: mealDayId,
        payload: jsonEncode({
          'adherence': adherence.value,
          'updated_at': DateTime.now().toIso8601String(), // 일단 로컬시간 사용
        }),
      );

      // 업데이트된 MealDay 조회 후 반환
      final updatedData = await _database.mealDao.getMealDayById(mealDayId); // TODO : data_source로 이동
      if (updatedData == null) {
        throw Exception('MealDay 조회 실패 (로컬)');
      }
      return updatedData.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  /// 새 MealEntry 추가
  @override
  Future<MealEntryEntity> createMealEntry({
    required String mealDayId,
    required MealCategory category,
    String? content,
    String? photoUrl,
    DateTime? eatenAt,
  }) async {
    try {
      final now = DateTime.now();
      final entity = MealEntryEntity(
        id: _uuid.v4(),
        mealDayId: mealDayId,
        category: category,
        content: content,
        photoUrl: photoUrl,
        eatenAt: eatenAt,
        createdAt: now, // 일단 로컬시간 사용
        updatedAt: now, // 일단 로컬시간 사용
        deletedAt: null,
      );

      // 로컬 업데이트
      await _localDataSource.createMealEntry(entity);

      // MealDay AI 메타데이터 갱신 (오프라인에서의 UX를 위한 버튼 활성화용)
      await _database.mealDao.updateMealDayAiMetadata(mealDayId); // TODO : data_source로 이동

      // Outbox에 작업 추가
      await _addToOutbox(
        operation: 'insert',
        tableName: 'meal_entries',
        recordId: entity.id,
        payload: jsonEncode(entity.toDto().toJson()),
      );
      return entity;
    } catch (e) {
      rethrow;
    }
  }

  /// MealEntry 수정
  @override
  Future<MealEntryEntity> updateMealEntry({
    required String entryId,
    required MealCategory category,
    String? content,
    String? photoUrl,
    DateTime? eatenAt,
  }) async {
    try {
      // 기존 MealEntry 조회
      final existingData = await _database.mealDao.getMealEntryById(entryId); // TODO : data_source로 이동
      if (existingData == null) {
        throw Exception('존재하지 않는 MealEntry를 수정할라고 함');
      }

      // 로컬 업데이트
      await _localDataSource.updateMealEntry(
        entryId: entryId,
        category: category,
        content: content,
        photoUrl: photoUrl,
        eatenAt: eatenAt,
      );

      // MealDay AI 메타데이터 갱신 (오프라인에서의 UX를 위한 버튼 활성화용)
      await _database.mealDao.updateMealDayAiMetadata(existingData.mealDayId); // TODO : data_source로 이동

      // Outbox에 작업 추가
      final updateData = <String, dynamic>{
        'updated_at': DateTime.now().toIso8601String(), // 일단 로컬시간 사용
      };
      updateData['category'] = category.value;
      updateData['photo_url'] = photoUrl;
      if (content != null) updateData['content'] = content;
      if (eatenAt != null) updateData['eaten_at'] = eatenAt.toIso8601String();

      await _addToOutbox(
        operation: 'update',
        tableName: 'meal_entries',
        recordId: entryId,
        payload: jsonEncode(updateData),
      );

      // 업데이트된 MealEntry 조회 및 반환
      final updatedData = await _database.mealDao.getMealEntryById(entryId); // TODO : data_source로 이동
      if (updatedData == null) {
        throw Exception('MealEntry 조회 실패 (로컬)');
      }
      return updatedData.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  /// MealEntry 삭제 (soft delete)
  @override
  Future<void> deleteMealEntry({
    required String entryId,
  }) async {
    try {
      // 기존 MealEntry 조회
      final existingData = await _database.mealDao.getMealEntryById(entryId); // TODO : data_source로 이동
      if (existingData == null) {
        throw Exception('Meal entry not found');
      }

      // 로컬 Soft Delete
      await _localDataSource.deleteMealEntry(entryId);

      // MealDay AI 메타데이터 갱신 (오프라인에서 UX를 위한 버튼 활성화용)
      await _database.mealDao.updateMealDayAiMetadata(existingData.mealDayId); // TODO : data_source로 이동

      // Outbox에 작업 추가
      await _addToOutbox(
        operation: 'delete',
        tableName: 'meal_entries',
        recordId: entryId,
        payload: jsonEncode({
          'deleted_at': DateTime.now().toIso8601String(), // 일단 로컬시간 사용
          'updated_at': DateTime.now().toIso8601String(), // 일단 로컬시간 사용
        }),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Outbox에 동기화 작업 추가 및 즉시 동기화 트리거
  Future<void> _addToOutbox({
    required String operation,
    required String tableName,
    required String recordId,
    required String payload,
  }) async {
    await _database.outboxDao.insertOutbox(
      OutboxCompanion(
        operation: drift.Value(operation),
        targetTable: drift.Value(tableName),
        recordId: drift.Value(recordId),
        payload: drift.Value(payload),
        createdAt: drift.Value(DateTime.now()),
        retryCount: const drift.Value(0),
      ),
    );

    // Outbox 추가 후 즉시 동기화 (백그라운드에서 실행, 에러는 syncService 내부에서 처리)
    unawaited(_syncService.syncAll());
  }
}
