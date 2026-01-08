import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/goals_entity.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';

part 'goals_view_model.g.dart';

@riverpod
class GoalsViewModel extends _$GoalsViewModel {
  @override
  void build() {}

  Future<void> saveGoal({
    required String goalTitle,
    required String goalUnit,
    required double goalValue,
    required DateTime goalDate,
    required bool isDone,
    required bool isMain,
  }) async {
    final userId = ref.read(userIdProvider);
    await ref
        .read(goalsRepositoryProvider)
        .saveGoal(
          GoalsEntity(
            userId: userId,
            goalTitle: goalTitle,
            goalUnit: goalUnit,
            goalValue: goalValue,
            goalDate: goalDate,
            isDone: isDone,
            isMain: isMain,
          ),
        );
  }

  Future<void> updateGoal({
    required String goalId,
    required String goalTitle,
    required String goalUnit,
    required double goalValue,
    required DateTime goalDate,
    required bool isDone,
    required bool isMain,
  }) async {
    await ref
        .read(goalsRepositoryProvider)
        .updateGoal(
          GoalsEntity(
            goalId: goalId,
            goalTitle: goalTitle,
            goalUnit: goalUnit,
            goalValue: goalValue,
            goalDate: goalDate,
            isDone: isDone,
            isMain: isMain,
          ),
        );
  }

  Future<void> deleteGoal(String goalId) async {
    await ref.read(goalsRepositoryProvider).deleteGoal(goalId);
  }
}
