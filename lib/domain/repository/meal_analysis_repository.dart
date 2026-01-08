import 'package:vitameal/domain/entity/meal_analysis_entity.dart';

abstract class MealAnalysisRepository {
  /// Edge Function을 호출하여 AI 분석 및 DB 저장
  Future<MealAnalysisEntity> requestAnalysis(String mealDayId);

  /// 특정 MealDay의 최신 분석 결과 조회
  Future<MealAnalysisEntity?> getLatestAnalysis(String mealDayId);

  /// 오늘 분석 횟수 조회 (일일 한도 체크용)
  Future<int> getTodayAnalysisCount(String userId);
}
