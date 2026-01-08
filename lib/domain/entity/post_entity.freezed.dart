// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostEntity {

 String? get id; String get title; String get ingredient; String get userId; String? get imageUrl; DateTime? get createdAt; List<int>? get selectedTagIds; List<RecipeStepEntity> get recipeSteps; bool get isBookmarked;
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEntityCopyWith<PostEntity> get copyWith => _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.selectedTagIds, selectedTagIds)&&const DeepCollectionEquality().equals(other.recipeSteps, recipeSteps)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,ingredient,userId,imageUrl,createdAt,const DeepCollectionEquality().hash(selectedTagIds),const DeepCollectionEquality().hash(recipeSteps),isBookmarked);

@override
String toString() {
  return 'PostEntity(id: $id, title: $title, ingredient: $ingredient, userId: $userId, imageUrl: $imageUrl, createdAt: $createdAt, selectedTagIds: $selectedTagIds, recipeSteps: $recipeSteps, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class $PostEntityCopyWith<$Res>  {
  factory $PostEntityCopyWith(PostEntity value, $Res Function(PostEntity) _then) = _$PostEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String ingredient, String userId, String? imageUrl, DateTime? createdAt, List<int>? selectedTagIds, List<RecipeStepEntity> recipeSteps, bool isBookmarked
});




}
/// @nodoc
class _$PostEntityCopyWithImpl<$Res>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._self, this._then);

  final PostEntity _self;
  final $Res Function(PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? ingredient = null,Object? userId = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? selectedTagIds = freezed,Object? recipeSteps = null,Object? isBookmarked = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTagIds: freezed == selectedTagIds ? _self.selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,recipeSteps: null == recipeSteps ? _self.recipeSteps : recipeSteps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepEntity>,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostEntity].
extension PostEntityPatterns on PostEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostEntity value)  $default,){
final _that = this;
switch (_that) {
case _PostEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  String ingredient,  String userId,  String? imageUrl,  DateTime? createdAt,  List<int>? selectedTagIds,  List<RecipeStepEntity> recipeSteps,  bool isBookmarked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.id,_that.title,_that.ingredient,_that.userId,_that.imageUrl,_that.createdAt,_that.selectedTagIds,_that.recipeSteps,_that.isBookmarked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  String ingredient,  String userId,  String? imageUrl,  DateTime? createdAt,  List<int>? selectedTagIds,  List<RecipeStepEntity> recipeSteps,  bool isBookmarked)  $default,) {final _that = this;
switch (_that) {
case _PostEntity():
return $default(_that.id,_that.title,_that.ingredient,_that.userId,_that.imageUrl,_that.createdAt,_that.selectedTagIds,_that.recipeSteps,_that.isBookmarked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  String ingredient,  String userId,  String? imageUrl,  DateTime? createdAt,  List<int>? selectedTagIds,  List<RecipeStepEntity> recipeSteps,  bool isBookmarked)?  $default,) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.id,_that.title,_that.ingredient,_that.userId,_that.imageUrl,_that.createdAt,_that.selectedTagIds,_that.recipeSteps,_that.isBookmarked);case _:
  return null;

}
}

}

/// @nodoc


class _PostEntity implements PostEntity {
  const _PostEntity({this.id, required this.title, required this.ingredient, required this.userId, this.imageUrl, this.createdAt, final  List<int>? selectedTagIds, final  List<RecipeStepEntity> recipeSteps = const [], this.isBookmarked = false}): _selectedTagIds = selectedTagIds,_recipeSteps = recipeSteps;
  

@override final  String? id;
@override final  String title;
@override final  String ingredient;
@override final  String userId;
@override final  String? imageUrl;
@override final  DateTime? createdAt;
 final  List<int>? _selectedTagIds;
@override List<int>? get selectedTagIds {
  final value = _selectedTagIds;
  if (value == null) return null;
  if (_selectedTagIds is EqualUnmodifiableListView) return _selectedTagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RecipeStepEntity> _recipeSteps;
@override@JsonKey() List<RecipeStepEntity> get recipeSteps {
  if (_recipeSteps is EqualUnmodifiableListView) return _recipeSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipeSteps);
}

@override@JsonKey() final  bool isBookmarked;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostEntityCopyWith<_PostEntity> get copyWith => __$PostEntityCopyWithImpl<_PostEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._selectedTagIds, _selectedTagIds)&&const DeepCollectionEquality().equals(other._recipeSteps, _recipeSteps)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,ingredient,userId,imageUrl,createdAt,const DeepCollectionEquality().hash(_selectedTagIds),const DeepCollectionEquality().hash(_recipeSteps),isBookmarked);

@override
String toString() {
  return 'PostEntity(id: $id, title: $title, ingredient: $ingredient, userId: $userId, imageUrl: $imageUrl, createdAt: $createdAt, selectedTagIds: $selectedTagIds, recipeSteps: $recipeSteps, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class _$PostEntityCopyWith<$Res> implements $PostEntityCopyWith<$Res> {
  factory _$PostEntityCopyWith(_PostEntity value, $Res Function(_PostEntity) _then) = __$PostEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, String ingredient, String userId, String? imageUrl, DateTime? createdAt, List<int>? selectedTagIds, List<RecipeStepEntity> recipeSteps, bool isBookmarked
});




}
/// @nodoc
class __$PostEntityCopyWithImpl<$Res>
    implements _$PostEntityCopyWith<$Res> {
  __$PostEntityCopyWithImpl(this._self, this._then);

  final _PostEntity _self;
  final $Res Function(_PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? ingredient = null,Object? userId = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? selectedTagIds = freezed,Object? recipeSteps = null,Object? isBookmarked = null,}) {
  return _then(_PostEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTagIds: freezed == selectedTagIds ? _self._selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as List<int>?,recipeSteps: null == recipeSteps ? _self._recipeSteps : recipeSteps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepEntity>,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
