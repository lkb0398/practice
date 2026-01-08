import '../../domain/entity/recipe_step_entity.dart';
import '../dto/recipe_step_dto.dart';

extension RecipeStepDtoMapper on RecipeStepDto {
  /// DTO를 Domain Entity로 변환
  RecipeStepEntity toEntity() {
    return RecipeStepEntity(
      stepOrder: stepOrder,
      description: description,
      imageUrl: imageUrl,
    );
  }
}

extension RecipeStepEntityMapper on RecipeStepEntity {
  /// Entity를 Map으로 변환 (Supabase 저장용)
  Map<String, dynamic> toSupabaseMap(String postId) {
    return {
      'post_id': postId,
      'step_order': stepOrder,
      'description': description,
      'image_url': imageUrl,
    };
  }
}
