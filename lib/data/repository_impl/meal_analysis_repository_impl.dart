import 'package:vitameal/data/data_source/meal_analysis_data_source.dart';
import 'package:vitameal/data/mapper/meal_analysis_mapper.dart';
import 'package:vitameal/domain/entity/meal_analysis_entity.dart';
import 'package:vitameal/domain/repository/meal_analysis_repository.dart';

class MealAnalysisRepositoryImpl implements MealAnalysisRepository {
  MealAnalysisRepositoryImpl(this._dataSource);

  final MealAnalysisDataSource _dataSource;

  @override
  Future<MealAnalysisEntity> requestAnalysis(String mealDayId) async {
    try {
      // Edge Function 호출 (분석 수행 + DB 저장)
      final response = await _dataSource.requestAnalysis(mealDayId);
      // Edge Function에서 반환한 JSON을 Entity로 변환
      final analysisJson = response['analysis'] as Map<String, dynamic>;
      return analysisJson.toMealAnalysisEntity(mealDayId: mealDayId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MealAnalysisEntity?> getLatestAnalysis(String mealDayId) async {
    try {
      final analysis = await _dataSource.getLatestAnalysis(mealDayId);
      return analysis?.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getTodayAnalysisCount(String userId) async {
    try {
      return await _dataSource.getTodayAnalysisCount(userId);
    } catch (e) {
      rethrow;
    }
  }
}
