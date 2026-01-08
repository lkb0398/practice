import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitameal/domain/enum/adherence_level_enum.dart';

part 'meal_day_entity.freezed.dart';

@freezed
abstract class MealDayEntity with _$MealDayEntity {
  const factory MealDayEntity({
    required String id, // id
    required String userId, // 사용자 id
    required DateTime mealDate, // 날짜  
    AdherenceLevel? adherence, // 성취도 자가평가
    required DateTime createdAt, // 생성한 날짜
    required DateTime updatedAt, // 수정한 날짜
    required int dataVersion, // 버전 (서버의 트리거를 통해 생성/수정시 증가)
    DateTime? lastEntryUpdatedAt, // 마지막으로 식단 업데이트한 날짜 (식단만 다룸)
    required bool needsAiRefresh, // AI 분석 버튼 활성화 필요
    String? latestAiSummary, // 가장 최근 AI 분석 내용 요약
    DateTime? deletedAt, // 삭제한 날짜 (soft delete 용)
  }) = _MealDayEntity;
}
