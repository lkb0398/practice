import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/meal_day_dto.dart';
import 'package:vitameal/data/dto/meal_entry_dto.dart';
import 'package:vitameal/data/mapper/meal_day_mapper.dart';
import 'package:vitameal/data/mapper/meal_entry_mapper.dart';
import 'package:vitameal/domain/entity/meal_day_entity.dart';
import 'package:vitameal/domain/entity/meal_entry_entity.dart';
import 'package:vitameal/domain/enum/adherence_level_enum.dart';

abstract class MealRemoteDataSource {
  /// 날짜 범위로 MealDay 목록 조회 (캘린더용)
  Future<List<MealDayEntity>> getMealDaysByDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  });

  /// 특정 날짜의 MealDay 조회
  Future<MealDayEntity?> getMealDayByDate({required String userId, required DateTime date});

  /// MealDay 생성
  Future<MealDayEntity> createMealDay(MealDayEntity entity);

  /// MealDay adherence 업데이트
  Future<void> updateMealDayAdherence({required String mealDayId, required AdherenceLevel adherence});

  /// MealEntry 목록 조회
  Future<List<MealEntryEntity>> getMealEntriesByMealDayId({required String mealDayId});

  /// MealEntry 생성
  Future<MealEntryEntity> createMealEntry(MealEntryEntity entity);

  /// MealEntry 수정
  Future<void> updateMealEntry({required String entryId, String? content, String? photoUrl, DateTime? eatenAt});

  /// MealEntry 삭제 (Soft Delete)
  Future<void> deleteMealEntry(String entryId);
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  MealRemoteDataSourceImpl(this._supabase);
  final SupabaseClient _supabase;

  @override
  Future<List<MealDayEntity>> getMealDaysByDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _supabase
          .from('meal_days')
          .select()
          .eq('user_id', userId)
          .gte('meal_date', startDate.toIso8601String())
          .lte('meal_date', endDate.toIso8601String())
          .order('meal_date', ascending: false);

      final result = (response as List).map((json) => MealDayDto.fromJson(json).toEntity()).toList();
      debugPrint('🌈 MealDays 불러오기: $startDate - $endDate');
      debugPrint('🌈 MealDays 불러옴: ${result.length}개');
      return result;
    } catch (e) {
      debugPrint('🌈 getMealDaysByDateRange: $e');
      throw Exception('getMealDaysByDateRange: $e');
    }
  }

  @override
  Future<MealDayEntity?> getMealDayByDate({required String userId, required DateTime date}) async {
    try {
      final response = await _supabase
          .from('meal_days')
          .select()
          .eq('user_id', userId)
          .eq('meal_date', date.toIso8601String().split('T')[0])
          .maybeSingle();

      if (response == null) {
        debugPrint('🌈 MealDay 없음');
        return null;
      }

      final result = MealDayDto.fromJson(response).toEntity();
      debugPrint('🌈 MealDay 조회 ${result.mealDate}');
      return result;
    } catch (e) {
      debugPrint('🌈 getMealDayByDate: $e');
      throw Exception('getMealDayByDate: $e');
    }
  }

  @override
  Future<MealDayEntity> createMealDay(MealDayEntity entity) async {
    try {
      final dto = entity.toDto();
      final response = await _supabase.from('meal_days').insert(dto.toJson()).select().single();

      final result = MealDayDto.fromJson(response).toEntity();
      debugPrint('🌈 MealDay 생성: ${result.id.substring(0, 8)}');
      return result;
    } catch (e) {
      debugPrint('🌈 createMealDay: $e');
      throw Exception('createMealDay: $e');
    }
  }

  @override
  Future<void> updateMealDayAdherence({required String mealDayId, required AdherenceLevel adherence}) async {
    try {
      await _supabase
          .from('meal_days')
          .update({'adherence': adherence.value, 'updated_at': DateTime.now().toIso8601String()})
          .eq('id', mealDayId);

      debugPrint('🌈 MealDay 성취도 자가평가 변경');
    } catch (e) {
      debugPrint('🌈 updateMealDayAdherence: $e');
      throw Exception('updateMealDayAdherence: $e');
    }
  }

  @override
  Future<List<MealEntryEntity>> getMealEntriesByMealDayId({required String mealDayId}) async {
    try {
      final response = await _supabase
          .from('meal_entries')
          .select()
          .eq('meal_day_id', mealDayId)
          .order('created_at', ascending: true);

      final result = (response as List).map((json) => MealEntryDto.fromJson(json).toEntity()).toList();
      debugPrint('🌈 해당 날짜 MealEntries 불러오기: ${result.length}개');
      return result;
    } catch (e) {
      debugPrint('🌈 getMealEntriesByMealDayId: $e');
      throw Exception('getMealEntriesByMealDayId: $e');
    }
  }

  @override
  Future<MealEntryEntity> createMealEntry(MealEntryEntity entity) async {
    try {
      final dto = entity.toDto();
      final response = await _supabase.from('meal_entries').insert(dto.toJson()).select().single();

      final result = MealEntryDto.fromJson(response).toEntity();
      debugPrint('🌈 MealEntry 생성: ${result.id.substring(0, 8)}');
      return result;
    } catch (e) {
      debugPrint('🌈 createMealEntry: $e');
      throw Exception('createMealEntry: $e');
    }
  }

  @override
  Future<void> updateMealEntry({required String entryId, String? content, String? photoUrl, DateTime? eatenAt}) async {
    try {
      final updateData = <String, dynamic>{'updated_at': DateTime.now().toIso8601String()};
      if (content != null) updateData['content'] = content;
      if (photoUrl != null) updateData['photo_url'] = photoUrl;
      if (eatenAt != null) updateData['eaten_at'] = eatenAt.toIso8601String();

      await _supabase.from('meal_entries').update(updateData).eq('id', entryId);

      debugPrint('🌈 MealEntry 수정: ${entryId.substring(0, 8)}');
    } catch (e) {
      debugPrint('🌈 updateMealEntry: $e');
      throw Exception('updateMealEntry: $e');
    }
  }

  @override
  Future<void> deleteMealEntry(String entryId) async {
    try {
      await _supabase
          .from('meal_entries')
          .update({'deleted_at': DateTime.now().toIso8601String(), 'updated_at': DateTime.now().toIso8601String()})
          .eq('id', entryId);

      debugPrint('🌈 MealEntry 삭제 (soft deleted): ${entryId.substring(0, 8)}');
    } catch (e) {
      debugPrint('🌈 deleteMealEntry: $e');
      throw Exception('deleteMealEntry: $e');
    }
  }
}
