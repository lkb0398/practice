import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_step_entity.freezed.dart';

@freezed
abstract class RecipeStepEntity with _$RecipeStepEntity {
  const factory RecipeStepEntity({
    required int stepOrder,
    required String description,
    String? imageUrl,
  }) = _RecipeStepEntity;
}
