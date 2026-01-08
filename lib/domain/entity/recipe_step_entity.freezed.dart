// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_step_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeStepEntity {

 int get stepOrder; String get description; String? get imageUrl;
/// Create a copy of RecipeStepEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStepEntityCopyWith<RecipeStepEntity> get copyWith => _$RecipeStepEntityCopyWithImpl<RecipeStepEntity>(this as RecipeStepEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStepEntity&&(identical(other.stepOrder, stepOrder) || other.stepOrder == stepOrder)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,stepOrder,description,imageUrl);

@override
String toString() {
  return 'RecipeStepEntity(stepOrder: $stepOrder, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $RecipeStepEntityCopyWith<$Res>  {
  factory $RecipeStepEntityCopyWith(RecipeStepEntity value, $Res Function(RecipeStepEntity) _then) = _$RecipeStepEntityCopyWithImpl;
@useResult
$Res call({
 int stepOrder, String description, String? imageUrl
});




}
/// @nodoc
class _$RecipeStepEntityCopyWithImpl<$Res>
    implements $RecipeStepEntityCopyWith<$Res> {
  _$RecipeStepEntityCopyWithImpl(this._self, this._then);

  final RecipeStepEntity _self;
  final $Res Function(RecipeStepEntity) _then;

/// Create a copy of RecipeStepEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepOrder = null,Object? description = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
stepOrder: null == stepOrder ? _self.stepOrder : stepOrder // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeStepEntity].
extension RecipeStepEntityPatterns on RecipeStepEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeStepEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeStepEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeStepEntity value)  $default,){
final _that = this;
switch (_that) {
case _RecipeStepEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeStepEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeStepEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepOrder,  String description,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeStepEntity() when $default != null:
return $default(_that.stepOrder,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepOrder,  String description,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _RecipeStepEntity():
return $default(_that.stepOrder,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepOrder,  String description,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _RecipeStepEntity() when $default != null:
return $default(_that.stepOrder,_that.description,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeStepEntity implements RecipeStepEntity {
  const _RecipeStepEntity({required this.stepOrder, required this.description, this.imageUrl});
  

@override final  int stepOrder;
@override final  String description;
@override final  String? imageUrl;

/// Create a copy of RecipeStepEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeStepEntityCopyWith<_RecipeStepEntity> get copyWith => __$RecipeStepEntityCopyWithImpl<_RecipeStepEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStepEntity&&(identical(other.stepOrder, stepOrder) || other.stepOrder == stepOrder)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,stepOrder,description,imageUrl);

@override
String toString() {
  return 'RecipeStepEntity(stepOrder: $stepOrder, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$RecipeStepEntityCopyWith<$Res> implements $RecipeStepEntityCopyWith<$Res> {
  factory _$RecipeStepEntityCopyWith(_RecipeStepEntity value, $Res Function(_RecipeStepEntity) _then) = __$RecipeStepEntityCopyWithImpl;
@override @useResult
$Res call({
 int stepOrder, String description, String? imageUrl
});




}
/// @nodoc
class __$RecipeStepEntityCopyWithImpl<$Res>
    implements _$RecipeStepEntityCopyWith<$Res> {
  __$RecipeStepEntityCopyWithImpl(this._self, this._then);

  final _RecipeStepEntity _self;
  final $Res Function(_RecipeStepEntity) _then;

/// Create a copy of RecipeStepEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepOrder = null,Object? description = null,Object? imageUrl = freezed,}) {
  return _then(_RecipeStepEntity(
stepOrder: null == stepOrder ? _self.stepOrder : stepOrder // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
