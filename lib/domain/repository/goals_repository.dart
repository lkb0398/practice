import 'package:vitameal/domain/entity/goals_entity.dart';

abstract class GoalsRepository {
  Future<void> saveGoal(GoalsEntity entity);
  Future<List<GoalsEntity>?> getAllGoals();
  Future<void> updateGoal(GoalsEntity entity);
  Future<void> deleteGoal(String goalId);
}
