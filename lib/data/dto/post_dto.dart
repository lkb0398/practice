import 'package:freezed_annotation/freezed_annotation.dart';
import 'recipe_step_dto.dart';

part 'post_dto.freezed.dart';
part 'post_dto.g.dart';

@freezed
abstract class PostDto with _$PostDto {
  const factory PostDto({
    String? id,
    required String title,
    required String ingredient,
    @JsonKey(name: "user_id") required String userId,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "selected_tag_ids") List<int>? selectedTagIds,
    @JsonKey(name: "recipe_steps") @Default([]) List<RecipeStepDto> recipeSteps,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
}
