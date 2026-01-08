import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/meal_analysis_entity.dart';
import 'package:vitameal/domain/repository/meal_analysis_repository.dart';

part 'meal_analysis_viewmodel.g.dart';

@riverpod
class MealAnalysisViewModel extends _$MealAnalysisViewModel {
  MealAnalysisRepository get _repository => ref.read(mealAnalysisRepositoryProvider);

  /// 상태는 Hook으로 관리
  @override
  void build() {}

  /// AI 분석 요청
  Future<MealAnalysisEntity> requestAnalysis(String mealDayId) async {
    return await _repository.requestAnalysis(mealDayId);
  }

  /// 특정 MealDay의 최신 분석 결과 조회
  Future<MealAnalysisEntity?> getLatestAnalysis(String mealDayId) async {
    return await _repository.getLatestAnalysis(mealDayId);
  }
}

/// 오늘 분석 횟수 Provider (State로 관리하도록)
/// KeepAlive로 날짜 변경 시에도 깜빡임 방지 시도
@Riverpod(keepAlive: true)
class TodayAnalysisCount extends _$TodayAnalysisCount {
  MealAnalysisRepository get _repository => ref.read(mealAnalysisRepositoryProvider);

  @override
  Future<int> build(String userId) async {
    return await _repository.getTodayAnalysisCount(userId);
  }

  /// 분석 완료 후 횟수 새로고침 용도
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _repository.getTodayAnalysisCount(userId);
    });
  }
}
