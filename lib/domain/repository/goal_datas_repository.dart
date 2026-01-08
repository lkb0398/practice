import 'package:vitameal/domain/entity/goal_datas_entity.dart';

abstract class GoalDatasRepository {
  Future<void> saveData(GoalDatasEntity entity);
  Future<List<GoalDatasEntity>?> getGoalDatas(String goalId);
  Future<void> deleteDatas(List<String> dataIds);
}
