import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_day_dto.freezed.dart';
part 'meal_day_dto.g.dart';

@freezed
abstract class MealDayDto with _$MealDayDto {
  const factory MealDayDto({
    required String id, // id
    @JsonKey(name: 'user_id') required String userId, // 사용자 id
    @JsonKey(name: 'meal_date') required String mealDate, // 날짜
    String? adherence, // 성취도 자가평가
    @JsonKey(name: 'created_at') required String createdAt, // 생성한 날짜
    @JsonKey(name: 'updated_at') required String updatedAt, // 수정한 날짜
    @JsonKey(name: 'data_version') required int dataVersion, // 버전 (서버의 트리거를 통해 생성/수정시 증가)
    @JsonKey(name: 'last_entry_updated_at') String? lastEntryUpdatedAt, // 마지막으로 식단 업데이트한 날짜 (식단만 다룸)
    @JsonKey(name: 'needs_ai_refresh') required bool needsAiRefresh, // AI 분석 버튼 활성화 필요
    @JsonKey(name: 'latest_ai_summary') String? latestAiSummary, // 가장 최근 AI 분석 내용 요약
    @JsonKey(name: 'deleted_at') String? deletedAt, // 삭제한 날짜 (soft delete 용)
  }) = _MealDayDto;

  factory MealDayDto.fromJson(Map<String, dynamic> json) => _$MealDayDtoFromJson(json);
}