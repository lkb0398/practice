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

    // 🔔 이 부분을 추가해줍니다!
    // Supabase에서 post_bookmarks(user_id)로 가져온 데이터를 담는 그릇입니다.
    @JsonKey(name: "post_bookmarks")
    @Default([])
    List<Map<String, dynamic>> postBookmarks,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
}
