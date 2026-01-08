import 'package:vitameal/data/dto/goals_dto.dart';
import 'package:vitameal/domain/entity/goals_entity.dart';

class GoalsMapper {
  // Entity > Dto
  static GoalsDto toDto(GoalsEntity entity) {
    return GoalsDto(
      userId: entity.userId,
      goalId: entity.goalId,
      goalTitle: entity.goalTitle,
      goalUnit: entity.goalUnit,
      goalValue: entity.goalValue,
      goalDate: entity.goalDate.toIso8601String(),
      isDone: entity.isDone,
      isMain: entity.isMain,
    );
  }

  // Dto > Entity
  static GoalsEntity toEntity(GoalsDto dto) {
    return GoalsEntity(
      userId: dto.userId,
      goalId: dto.goalId,
      goalTitle: dto.goalTitle,
      goalUnit: dto.goalUnit,
      goalValue: dto.goalValue.toDouble(),
      goalDate: DateTime.parse(dto.goalDate),
      isDone: dto.isDone,
      isMain: dto.isMain,
    );
  }
}
