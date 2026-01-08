import 'package:drift/drift.dart';
import 'package:vitameal/data/database/database.dart';
import 'package:vitameal/data/database/table/meal_days_table.dart';
import 'package:vitameal/data/database/table/meal_entries_table.dart';
import 'package:vitameal/domain/enum/meal_category_enum.dart';

part 'meal_dao.g.dart';

/// 로컬 DB DAO
@DriftAccessor(tables: [MealDays, MealEntries])
class MealDao extends DatabaseAccessor<AppDatabase> with _$MealDaoMixin {
  MealDao(AppDatabase db) : super(db);

  /// 날짜 범위로 MealDay 조회 (캘린더용)
  Future<List<MealDayData>> getMealDaysByDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return (select(mealDays)
          ..where((t) => t.userId.equals(userId))
          ..where((t) => t.deletedAt.isNull())
          ..where((t) => t.mealDate.isBiggerOrEqualValue(startDate))
          ..where((t) => t.mealDate.isSmallerOrEqualValue(endDate))
          ..orderBy([(t) => OrderingTerm.desc(t.mealDate)]))
        .get();
  }

  /// 특정 날짜의 MealDay 조회
  Future<MealDayData?> getMealDayByDate({
    required String userId,
    required DateTime date,
  }) {
    return (select(mealDays)
          ..where((t) => t.userId.equals(userId))
          ..where((t) => t.deletedAt.isNull())
          ..where((t) => t.mealDate.equals(date)))
        .getSingleOrNull();
  }

  /// ID로 MealDay 조회
  Future<MealDayData?> getMealDayById(String mealDayId) {
    return (select(mealDays)
          ..where((t) => t.id.equals(mealDayId))
          ..where((t) => t.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// MealDay upsert
  Future<void> upsertMealDay(MealDaysCompanion companion) {
    return into(mealDays).insertOnConflictUpdate(companion);
  }

  /// MealDay adherence 업데이트
  Future<int> updateMealDayAdherence({
    required String mealDayId,
    required String adherence,
  }) {
    return (update(mealDays)..where((t) => t.id.equals(mealDayId)))
        .write(MealDaysCompanion(
      adherence: Value(adherence),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// MealDay 삭제 (Soft Delete)
  Future<int> deleteMealDay(String mealDayId) {
    return (update(mealDays)..where((t) => t.id.equals(mealDayId)))
        .write(MealDaysCompanion(
      deletedAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// MealDay 하드 삭제 (동기화용)
  Future<int> hardDeleteMealDay(String mealDayId) {
    return (delete(mealDays)..where((t) => t.id.equals(mealDayId))).go();
  }

  /// MealDay AI 메타데이터 갱신 (오프라인상태에서 meal_entries 변경 시 호출)
  /// data_version은 건드리지 않음 (서버 트리거로만 증가시킴)
  /// needs_ai_refresh = true, last_entry_updated_at = now()로만 갱신해서 버튼 보이게 (UX 개선)
  Future<void> updateMealDayAiMetadata(String mealDayId) async {
    final now = DateTime.now();

    await customUpdate(
      'UPDATE meal_days SET '
      'needs_ai_refresh = 1, '
      'last_entry_updated_at = ? '
      'WHERE id = ?',
      variables: [
        Variable.withDateTime(now),
        Variable.withString(mealDayId),
      ],
      updates: {mealDays},
    );
  }

  /// AI 분석 완료 후 메타데이터 갱신
  /// needs_ai_refresh = false, latest_ai_summary 업데이트
  Future<void> updateMealDayAfterAnalysis({required String mealDayId, required String summary}) async {
    await customUpdate(
      'UPDATE meal_days SET '
      'needs_ai_refresh = 0, '
      'latest_ai_summary = ?, '
      'updated_at = ? '
      'WHERE id = ?',
      variables: [Variable.withString(summary), Variable.withDateTime(DateTime.now()), Variable.withString(mealDayId)],
      updates: {mealDays},
    );
  }

  /// MealDay에 속한 MealEntry 목록 조회
  Future<List<MealEntryData>> getMealEntriesByMealDayId({
    required String mealDayId,
  }) {
    return (select(mealEntries)
          ..where((t) => t.mealDayId.equals(mealDayId))
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// ID로 MealEntry 조회
  Future<MealEntryData?> getMealEntryById(String entryId) {
    return (select(mealEntries)
          ..where((t) => t.id.equals(entryId))
          ..where((t) => t.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// MealEntry 생성
  Future<void> insertMealEntry(MealEntriesCompanion companion) {
    return into(mealEntries).insert(companion);
  }

  /// MealEntry upsert
  Future<void> upsertMealEntry(MealEntriesCompanion companion) {
    return into(mealEntries).insertOnConflictUpdate(companion);
  }

  /// MealEntry 업데이트
  Future<int> updateMealEntry({
    required String entryId,
    required MealCategory category,
    String? content,
    String? photoUrl,
    DateTime? eatenAt,
  }) {
    return (update(mealEntries)..where((t) => t.id.equals(entryId)))
        .write(MealEntriesCompanion(
      category: Value(category.value),
      content: content != null ? Value(content) : const Value.absent(),
      photoUrl: photoUrl != null ? Value(photoUrl) : const Value.absent(),
      eatenAt: eatenAt != null ? Value(eatenAt) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// MealEntry 삭제 (Soft Delete)
  Future<int> deleteMealEntry(String entryId) {
    return (update(mealEntries)..where((t) => t.id.equals(entryId)))
        .write(MealEntriesCompanion(
      deletedAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// MealEntry 하드 삭제 (동기화용)
  Future<int> hardDeleteMealEntry(String entryId) {
    return (delete(mealEntries)..where((t) => t.id.equals(entryId))).go();
  }
}
