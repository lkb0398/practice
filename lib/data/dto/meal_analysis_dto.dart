import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_analysis_dto.freezed.dart';
part 'meal_analysis_dto.g.dart';

/// AI 분석 결과 DTO (meal_day_analyses 테이블)
@freezed
abstract class MealAnalysisDto with _$MealAnalysisDto {
  const factory MealAnalysisDto({
    required String id, // ID
    @JsonKey(name: 'meal_day_id') required String mealDayId, // MealDay ID
    @JsonKey(name: 'user_id') required String userId, // User ID
    @JsonKey(name: 'based_on_version') required int basedOnVersion, // 분석 당시 MealDay 버전
    String? locale, // 언어
    @JsonKey(name: 'overall_summary') required String overallSummary, // 분석 요약
    @JsonKey(name: 'condition_feedback') List<Map<String, dynamic>>? conditionFeedback, // 기저질환별 피드백
    List<Map<String, dynamic>>? suggestions, // 제안
    required Map<String, dynamic> result, // 전체 AI 응답 JSON
    @JsonKey(name: 'created_at') required String createdAt, // 생성시간
  }) = _MealAnalysisDto;

  factory MealAnalysisDto.fromJson(Map<String, dynamic> json) =>
      _$MealAnalysisDtoFromJson(json);
}