import 'package:vitameal/data/dto/meal_analysis_dto.dart';
import 'package:vitameal/domain/entity/meal_analysis_entity.dart';

// TODO : DB에서 가져오는거랑 EdgeFunction 바로 가져오는거랑 일단 분리함, 중복로직 어케 하지..

/// DTO(Supabase) -> Domain(Entity)
extension MealAnalysisDtoMapper on MealAnalysisDto {
  MealAnalysisEntity toEntity() {
    // result JSON에서 데이터 파싱
    final resultData = result;

    // condition_feedback 파싱
    final conditionFeedbackList = (resultData['condition_feedback'] as List?)
            ?.map((item) => ConditionFeedback(
                  condition: item['condition'] as String,
                  summary: item['summary'] as String,
                  points: (item['points'] as List).cast<String>(),
                  suggestions: (item['suggestions'] as List)
                      .map((s) => Suggestion(
                            title: s['title'] as String,
                            detail: s['detail'] as String,
                          ))
                      .toList(),
                  confidence: (item['confidence'] as num).toDouble(),
                ))
            .toList() ??
        [];

    // nutrition_feedback 파싱
    final nutritionData = resultData['nutrition_feedback'] as Map<String, dynamic>? ?? {};
    final nutritionFeedback = NutritionFeedback(
      summary: nutritionData['summary'] as String? ?? '',
      goodPoints: (nutritionData['good_points'] as List?)?.cast<String>() ?? [],
      improvePoints: (nutritionData['improve_points'] as List?)?.cast<String>() ?? [],
      nextActions: (nutritionData['next_actions'] as List?)
              ?.map((action) => NextAction(
                    title: action['title'] as String,
                    detail: action['detail'] as String,
                  ))
              .toList() ??
          [],
      confidence: (nutritionData['confidence'] as num?)?.toDouble() ?? 0.0,
    );

    // uncertainties 파싱
    final uncertainties = (resultData['uncertainties'] as List?)?.cast<String>() ?? [];

    // disclaimer 파싱
    final disclaimer = resultData['disclaimer'] as String? ?? '';

    return MealAnalysisEntity(
      id: id,
      mealDayId: mealDayId,
      overallSummary: overallSummary,
      conditionFeedback: conditionFeedbackList,
      nutritionFeedback: nutritionFeedback,
      uncertainties: uncertainties,
      disclaimer: disclaimer,
      createdAt: DateTime.parse(createdAt),
    );
  }
}

/// Edge Function 응답 JSON -> Domain(Entity)
extension EdgeFunctionResponseMapper on Map<String, dynamic> {
  /// Edge Function에서 반환한 분석 JSON을 Entity로 변환
  MealAnalysisEntity toMealAnalysisEntity({required String mealDayId}) {
    // condition_feedback 파싱
    final conditionFeedbackList = (this['condition_feedback'] as List?)
            ?.map((item) => ConditionFeedback(
                  condition: item['condition'] as String,
                  summary: item['summary'] as String,
                  points: (item['points'] as List).cast<String>(),
                  suggestions: (item['suggestions'] as List)
                      .map((s) => Suggestion(
                            title: s['title'] as String,
                            detail: s['detail'] as String,
                          ))
                      .toList(),
                  confidence: (item['confidence'] as num).toDouble(),
                ))
            .toList() ??
        [];

    // nutrition_feedback 파싱
    final nutritionData = this['nutrition_feedback'] as Map<String, dynamic>? ?? {};
    final nutritionFeedback = NutritionFeedback(
      summary: nutritionData['summary'] as String? ?? '',
      goodPoints: (nutritionData['good_points'] as List?)?.cast<String>() ?? [],
      improvePoints: (nutritionData['improve_points'] as List?)?.cast<String>() ?? [],
      nextActions: (nutritionData['next_actions'] as List?)
              ?.map((action) => NextAction(
                    title: action['title'] as String,
                    detail: action['detail'] as String,
                  ))
              .toList() ??
          [],
      confidence: (nutritionData['confidence'] as num?)?.toDouble() ?? 0.0,
    );

    // uncertainties, disclaimer 파싱
    final uncertainties = (this['uncertainties'] as List?)?.cast<String>() ?? [];
    final disclaimer = this['disclaimer'] as String? ?? '';

    return MealAnalysisEntity(
      id: '', // Edge Function 응답에는 id 없음 (DB 저장 후 조회 시에만 있음)
      mealDayId: mealDayId,
      overallSummary: this['overall_summary'] as String? ?? '',
      conditionFeedback: conditionFeedbackList,
      nutritionFeedback: nutritionFeedback,
      uncertainties: uncertainties,
      disclaimer: disclaimer,
      createdAt: DateTime.now(),
    );
  }
}
