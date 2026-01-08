import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_analysis_entity.freezed.dart';

/// AI 분석 결과 Entity
/// jsonb 필드들은 프롬프트 응답 json 구조에 맞게 엔티티 분리하기.
@freezed
abstract class MealAnalysisEntity with _$MealAnalysisEntity {
  const factory MealAnalysisEntity({
    required String id, // 분석 결과 ID
    required String mealDayId, // MealDay ID
    required String overallSummary, // 분석 요약
    required List<ConditionFeedback> conditionFeedback, // 기저질환별 피드백
    required NutritionFeedback nutritionFeedback, // 영양 피드백
    required List<String> uncertainties, // 불확실한 부분
    required String disclaimer, // 면책 조항
    required DateTime createdAt, // 생성 시간
  }) = _MealAnalysisEntity;
}

/// 기저질환별 피드백
@freezed
abstract class ConditionFeedback with _$ConditionFeedback {
  const factory ConditionFeedback({
    required String condition, // 기저질환 명
    required String summary, // 해당 질환 관련 패드백 요약
    required List<String> points, // 포인트 내용들
    required List<Suggestion> suggestions, // 개선 제안 리스트
    required double confidence, // 신뢰도
  }) = _ConditionFeedback;
}

/// 개선 제안
@freezed
abstract class Suggestion with _$Suggestion {
  const factory Suggestion({
    required String title, // 제안 제목
    required String detail, // 제안 상세 내용
  }) = _Suggestion;
}

/// 영양 피드백
/// 일단 사용하진 않음
@freezed
abstract class NutritionFeedback with _$NutritionFeedback {
  const factory NutritionFeedback({
    required String summary, // 영양 요약
    required List<String> goodPoints, // 잘한 점
    required List<String> improvePoints, // 개선할 점
    required List<NextAction> nextActions, // 다음으로 해야할거
    required double confidence, // 신뢰도
  }) = _NutritionFeedback;
}

/// 다음으로 해야할거
@freezed
abstract class NextAction with _$NextAction {
  const factory NextAction({
    required String title, // 제목
    required String detail, // 상세 내용
  }) = _NextAction;
}
