// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostDto {

 String? get id; String get title; String get ingredient;@JsonKey(name: "user_id") String get userId;@JsonKey(name: "image_url") String? get imageUrl;@JsonKey(name: "created_at") DateTime? get createdAt;@JsonKey(name: "selected_tag_ids") List<int>? get selectedTagIds;@JsonKey(name: "recipe_steps") List<RecipeStepDto> get recipeSteps;// 🔔 이 부분을 추가해줍니다!
// Supabase에서 post_bookmarks(user_id)로 가져온 데이터를 담는 그릇입니다.
@JsonKey(name: "post_bookmarks") List<Map<String, dynamic>> get postBookmarks;
/// Create a copy of PostDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDtoCopyWith<PostDto> get copyWith => _$PostDtoCopyWithImpl<PostDto>(this as PostDto, _$identity);

  /// Serializes this PostDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.selectedTagIds, selectedTagIds)&&const DeepCollectionEquality().equals(other.recipeSteps, recipeSteps)&&const DeepCollectionEquality().equals(other.postBookmarks, postBookmarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,ingredient,userId,imageUrl,createdAt,const DeepCollectionEquality().hash(selectedTagIds),const DeepCollectionEquality().hash(recipeSteps),const DeepCollectionEquality().hash(postBookmarks));

@override
String toString() {
  return 'PostDto(id: $id, title: $title, ingredient: $ingredient, userId: $userId, imageUrl: $imageUrl, createdAt: $createdAt, selectedTagIds: $selectedTagIds, recipeSteps: $recipeSteps, postBookmarks: $postBookmarks)';
}


}

/// @nodoc
abstract mixin class $PostDtoCopyWith<$Res>  {
  factory $PostDtoCopyWith(PostDto value, $Res Function(PostDto) _then) = _$PostDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String ingredient,@JsonKey(name: "user_id") String userId,@JsonKey(name: "image_url") String? imageUrl,@JsonKey(name: "created_at") DateTime? createdAt,@JsonKey(name: "selected_tag_ids") List<int>? selectedTagIds,@JsonKey(name: "recipe_steps") List<RecipeStepDto> recipeSteps,@JsonKey(name: "post_bookmarks") List<Map<String, dynamic>> postBookmarks
});




}
/// @nodoc
class _$PostDtoCopyWithImpl<$Res>
    implements $PostDtoCopyWith<$Res> {
  _$PostDtoCopyWithImpl(this._self, this._then);

  final PostDto _self;
  final $Res Function(PostDto) _then;

/// Create a copy of PostDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? ingredient = null,Object? userId = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? selectedTagIds = freezed,Object? recipeSteps = null,Object? postBookmarks = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTagIds: freezed == selectedTagIds ? _self.selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,recipeSteps: null == recipeSteps ? _self.recipeSteps : recipeSteps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepDto>,postBookmarks: null == postBookmarks ? _self.postBookmarks : postBookmarks // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [PostDto].
extension PostDtoPatterns on PostDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDto value)  $default,){
final _that = this;
switch (_that) {
case _PostDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDto value)?  $default,){
final _that = this;
switch (_that) {
case _PostDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  String ingredient, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "image_url")  String? imageUrl, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "selected_tag_ids")  List<int>? selectedTagIds, @JsonKey(name: "recipe_steps")  List<RecipeStepDto> recipeSteps, @JsonKey(name: "post_bookmarks")  List<Map<String, dynamic>> postBookmarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDto() when $default != null:
return $default(_that.id,_that.title,_that.ingredient,_that.userId,_that.imageUrl,_that.createdAt,_that.selectedTagIds,_that.recipeSteps,_that.postBookmarks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  String ingredient, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "image_url")  String? imageUrl, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "selected_tag_ids")  List<int>? selectedTagIds, @JsonKey(name: "recipe_steps")  List<RecipeStepDto> recipeSteps, @JsonKey(name: "post_bookmarks")  List<Map<String, dynamic>> postBookmarks)  $default,) {final _that = this;
switch (_that) {
case _PostDto():
return $default(_that.id,_that.title,_that.ingredient,_that.userId,_that.imageUrl,_that.createdAt,_that.selectedTagIds,_that.recipeSteps,_that.postBookmarks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  String ingredient, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "image_url")  String? imageUrl, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "selected_tag_ids")  List<int>? selectedTagIds, @JsonKey(name: "recipe_steps")  List<RecipeStepDto> recipeSteps, @JsonKey(name: "post_bookmarks")  List<Map<String, dynamic>> postBookmarks)?  $default,) {final _that = this;
switch (_that) {
case _PostDto() when $default != null:
return $default(_that.id,_that.title,_that.ingredient,_that.userId,_that.imageUrl,_that.createdAt,_that.selectedTagIds,_that.recipeSteps,_that.postBookmarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostDto implements PostDto {
  const _PostDto({this.id, required this.title, required this.ingredient, @JsonKey(name: "user_id") required this.userId, @JsonKey(name: "image_url") this.imageUrl, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "selected_tag_ids") final  List<int>? selectedTagIds, @JsonKey(name: "recipe_steps") final  List<RecipeStepDto> recipeSteps = const [], @JsonKey(name: "post_bookmarks") final  List<Map<String, dynamic>> postBookmarks = const []}): _selectedTagIds = selectedTagIds,_recipeSteps = recipeSteps,_postBookmarks = postBookmarks;
  factory _PostDto.fromJson(Map<String, dynamic> json) => _$PostDtoFromJson(json);

@override final  String? id;
@override final  String title;
@override final  String ingredient;
@override@JsonKey(name: "user_id") final  String userId;
@override@JsonKey(name: "image_url") final  String? imageUrl;
@override@JsonKey(name: "created_at") final  DateTime? createdAt;
 final  List<int>? _selectedTagIds;
@override@JsonKey(name: "selected_tag_ids") List<int>? get selectedTagIds {
  final value = _selectedTagIds;
  if (value == null) return null;
  if (_selectedTagIds is EqualUnmodifiableListView) return _selectedTagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RecipeStepDto> _recipeSteps;
@override@JsonKey(name: "recipe_steps") List<RecipeStepDto> get recipeSteps {
  if (_recipeSteps is EqualUnmodifiableListView) return _recipeSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipeSteps);
}

// 🔔 이 부분을 추가해줍니다!
// Supabase에서 post_bookmarks(user_id)로 가져온 데이터를 담는 그릇입니다.
 final  List<Map<String, dynamic>> _postBookmarks;
// 🔔 이 부분을 추가해줍니다!
// Supabase에서 post_bookmarks(user_id)로 가져온 데이터를 담는 그릇입니다.
@override@JsonKey(name: "post_bookmarks") List<Map<String, dynamic>> get postBookmarks {
  if (_postBookmarks is EqualUnmodifiableListView) return _postBookmarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_postBookmarks);
}


/// Create a copy of PostDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDtoCopyWith<_PostDto> get copyWith => __$PostDtoCopyWithImpl<_PostDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._selectedTagIds, _selectedTagIds)&&const DeepCollectionEquality().equals(other._recipeSteps, _recipeSteps)&&const DeepCollectionEquality().equals(other._postBookmarks, _postBookmarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,ingredient,userId,imageUrl,createdAt,const DeepCollectionEquality().hash(_selectedTagIds),const DeepCollectionEquality().hash(_recipeSteps),const DeepCollectionEquality().hash(_postBookmarks));

@override
String toString() {
  return 'PostDto(id: $id, title: $title, ingredient: $ingredient, userId: $userId, imageUrl: $imageUrl, createdAt: $createdAt, selectedTagIds: $selectedTagIds, recipeSteps: $recipeSteps, postBookmarks: $postBookmarks)';
}


}

/// @nodoc
abstract mixin class _$PostDtoCopyWith<$Res> implements $PostDtoCopyWith<$Res> {
  factory _$PostDtoCopyWith(_PostDto value, $Res Function(_PostDto) _then) = __$PostDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, String ingredient,@JsonKey(name: "user_id") String userId,@JsonKey(name: "image_url") String? imageUrl,@JsonKey(name: "created_at") DateTime? createdAt,@JsonKey(name: "selected_tag_ids") List<int>? selectedTagIds,@JsonKey(name: "recipe_steps") List<RecipeStepDto> recipeSteps,@JsonKey(name: "post_bookmarks") List<Map<String, dynamic>> postBookmarks
});




}
/// @nodoc
class __$PostDtoCopyWithImpl<$Res>
    implements _$PostDtoCopyWith<$Res> {
  __$PostDtoCopyWithImpl(this._self, this._then);

  final _PostDto _self;
  final $Res Function(_PostDto) _then;

/// Create a copy of PostDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? ingredient = null,Object? userId = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? selectedTagIds = freezed,Object? recipeSteps = null,Object? postBookmarks = null,}) {
  return _then(_PostDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTagIds: freezed == selectedTagIds ? _self._selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,recipeSteps: null == recipeSteps ? _self._recipeSteps : recipeSteps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepDto>,postBookmarks: null == postBookmarks ? _self._postBookmarks : postBookmarks // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
