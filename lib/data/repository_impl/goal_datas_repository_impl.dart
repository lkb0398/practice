import 'package:vitameal/data/data_source/goal_datas_data_source.dart';
import 'package:vitameal/domain/entity/goal_datas_entity.dart';
import 'package:vitameal/data/mapper/goal_datas_mapper.dart';
import 'package:vitameal/domain/repository/goal_datas_repository.dart';

class GoalDatasRepositoryImpl implements GoalDatasRepository {
  GoalDatasRepositoryImpl(this.dataSource);

  final GoalDatasDataSource dataSource;

  @override
  Future<List<GoalDatasEntity>?> getGoalDatas(String goalId) async {
    final dtos = await dataSource.getGoalDatas(goalId);
    if (dtos == null) return [];
    return dtos.map(GoalDatasMapper.toEntity).toList();
  }

  @override
  Future<void> saveData(GoalDatasEntity entity) async {
    final dto = GoalDatasMapper.toDto(entity);
    await dataSource.saveData(dto);
  }

  @override
  Future<void> deleteDatas(List<String> dataIds) async {
    await dataSource.deleteDatas(dataIds);
  }
}
