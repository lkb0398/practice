import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_step_dto.freezed.dart';
part 'recipe_step_dto.g.dart';

@freezed
abstract class RecipeStepDto with _$RecipeStepDto {
  const factory RecipeStepDto({
    @JsonKey(name: "step_order") required int stepOrder,
    required String description,
    @JsonKey(name: "image_url") String? imageUrl,
  }) = _RecipeStepDto;

  factory RecipeStepDto.fromJson(Map<String, dynamic> json) => _$RecipeStepDtoFromJson(json);
}