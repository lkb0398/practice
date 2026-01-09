// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostDto _$PostDtoFromJson(Map<String, dynamic> json) => _PostDto(
  id: json['id'] as String?,
  title: json['title'] as String,
  ingredient: json['ingredient'] as String,
  userId: json['user_id'] as String,
  imageUrl: json['image_url'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  selectedTagIds: (json['selected_tag_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  recipeSteps:
      (json['recipe_steps'] as List<dynamic>?)
          ?.map((e) => RecipeStepDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  postBookmarks:
      (json['post_bookmarks'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
);

Map<String, dynamic> _$PostDtoToJson(_PostDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'ingredient': instance.ingredient,
  'user_id': instance.userId,
  'image_url': instance.imageUrl,
  'created_at': instance.createdAt?.toIso8601String(),
  'selected_tag_ids': instance.selectedTagIds,
  'recipe_steps': instance.recipeSteps,
  'post_bookmarks': instance.postBookmarks,
};
