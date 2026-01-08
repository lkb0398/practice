import '../../domain/entity/post_entity.dart';
import '../dto/post_dto.dart';
import 'recipe_step_mapper.dart';

extension PostDtoMapper on PostDto {
  /// DTO를 Domain Entity로 변환
  PostEntity toEntity({bool isBookmarked = false}) {
    return PostEntity(
      id: id,
      title: title,
      ingredient: ingredient,
      userId: userId,
      imageUrl: imageUrl,
      createdAt: createdAt,
      selectedTagIds: selectedTagIds,
      recipeSteps: recipeSteps.map((step) => step.toEntity()).toList(),
      isBookmarked: isBookmarked,
    );
  }
}

extension PostEntityMapper on PostEntity {
  /// (필요 시) Entity를 DTO나 Map으로 변환 (생성/수정용)
  Map<String, dynamic> toSupabaseInsertMap() {
    return {
      'title': title,
      'ingredient': ingredient,
      'image_url': imageUrl,
      'user_id': userId,
      // selected_tag_ids나 recipe_steps는 별도 테이블이므로 여기서 제외하거나
      // 레포지토리 로직에 따라 조절합니다.
    };
  }
}
