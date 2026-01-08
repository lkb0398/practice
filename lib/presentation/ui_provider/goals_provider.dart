import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/goals_entity.dart';
import 'package:vitameal/domain/entity/goal_datas_entity.dart';

part 'goals_provider.g.dart';

/// 전체 목표 가져오기 Provider
@riverpod
Future<List<GoalsEntity>?> getAllGoals(Ref ref) async {
  return ref.read(goalsRepositoryProvider).getAllGoals();
}

/// 특정 목표 가져오기 Provider
@riverpod
GoalsEntity? getGoal(Ref ref, String goalId) {
  final goalsAsync = ref.watch(getAllGoalsProvider);
  return goalsAsync.whenOrNull(
    data: (goals) {
      if (goals == null) return null;
      try {
        return goals.firstWhere((g) => g.goalId == goalId);
      } catch (_) {
        return null;
      }
    },
  );
}

/// 대표 설정된 목표 가져오기 Provider
@riverpod
GoalsEntity? getMainGoal(Ref ref) {
  final goalsAsync = ref.watch(getAllGoalsProvider);
  return goalsAsync.whenOrNull(
    data: (goals) {
      if (goals == null || goals.isEmpty) return null;
      try {
        return goals.firstWhere((g) => g.isMain);
      } catch (_) {
        return null;
      }
    },
  );
}

/// 특정 목표의 전체 데이터 가져오기 Provider
@riverpod
Future<List<GoalDatasEntity>?> getGoalDatas(Ref ref, String goalId) async {
  return ref.read(goalDatasRepositoryProvider).getGoalDatas(goalId);
}

/// 대표 설정한 목표의 데이터 가져오기 Provider
@riverpod // 전체 데이터
List<GoalDatasEntity>? getMainGoalDatas(Ref ref) {
  final mainGoal = ref.watch(getMainGoalProvider);
  if (mainGoal == null) {
    return null;
  }
  final goalDatasAsync = ref.watch(getGoalDatasProvider(mainGoal.goalId!));
  return goalDatasAsync.whenOrNull(
    data: (datas) {
      if (datas == null || datas.isEmpty) return null;
      try {
        return datas;
      } catch (_) {
        return null;
      }
    },
  );
}

@riverpod // 초기 데이터
GoalDatasEntity? oldestMainGoalData(Ref ref) {
  final datas = ref.watch(getMainGoalDatasProvider);
  if (datas == null || datas.isEmpty) return null;
  return datas.last;
}

@riverpod // 최신 데이터
GoalDatasEntity? latestMainGoalData(Ref ref) {
  final datas = ref.watch(getMainGoalDatasProvider);
  if (datas == null || datas.isEmpty) return null;
  return datas.first;
}

@riverpod // 최신 5개 데이터
List<GoalDatasEntity>? latest5MainGoalDatas(Ref ref) {
  final datas = ref.watch(getMainGoalDatasProvider);
  if (datas == null || datas.isEmpty) return null;
  return datas.take(5).toList();
}
