import 'package:vitameal/data/dto/goal_datas_dto.dart';
import 'package:vitameal/domain/entity/goal_datas_entity.dart';

class GoalDatasMapper {
  // Entity > Dto
  static GoalDatasDto toDto(GoalDatasEntity entity) {
    return GoalDatasDto(
      goalId: entity.goalId,
      dataId: entity.dataId,
      dataDate: entity.dataDate.toIso8601String(),
      dataValue: entity.dataValue,
    );
  }

  // Dto > Entity
  static GoalDatasEntity toEntity(GoalDatasDto dto) {
    return GoalDatasEntity(
      goalId: dto.goalId,
      dataId: dto.dataId,
      dataDate: DateTime.parse(dto.dataDate),
      dataValue: dto.dataValue,
    );
  }
}
