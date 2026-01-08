import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/meal_analysis_entity.dart';
import 'package:vitameal/domain/entity/meal_entry_entity.dart';

/// 의존성 주입 대상이 아닌 다른 프로바이더들을 정의
part 'meal_provider.g.dart';

/// 선택된 날짜의 MealEntry 목록을 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려
@riverpod
Future<List<MealEntryEntity>> mealEntries(Ref ref, String mealDayId) async {
  final repository = ref.read(mealRepositoryProvider);
  return await repository.getMealEntriesByMealDayId(mealDayId: mealDayId);
}

/// 특정 MealDay의 최신 AI 분석 결과를 조회하는 프로바이더
/// TODO : 나중에 vm에서 state 클래스로 관리하도록 리펙토링 고려
@riverpod
Future<MealAnalysisEntity?> latestMealAnalysis(Ref ref, String mealDayId) async {
  final repository = ref.watch(mealAnalysisRepositoryProvider);
  return repository.getLatestAnalysis(mealDayId);
}
