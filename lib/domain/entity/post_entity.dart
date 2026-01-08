import 'package:freezed_annotation/freezed_annotation.dart';
import 'recipe_step_entity.dart';

part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const factory PostEntity({
    String? id,
    required String title,
    required String ingredient,
    required String userId,
    String? imageUrl,
    DateTime? createdAt,
    List<int>? selectedTagIds,
    @Default([]) List<RecipeStepEntity> recipeSteps,
    @Default(false) bool isBookmarked,
  }) = _PostEntity;
}
