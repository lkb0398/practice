// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_step_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeStepDto {

@JsonKey(name: "step_order") int get stepOrder; String get description;@JsonKey(name: "image_url") String? get imageUrl;
/// Create a copy of RecipeStepDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStepDtoCopyWith<RecipeStepDto> get copyWith => _$RecipeStepDtoCopyWithImpl<RecipeStepDto>(this as RecipeStepDto, _$identity);

  /// Serializes this RecipeStepDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStepDto&&(identical(other.stepOrder, stepOrder) || other.stepOrder == stepOrder)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepOrder,description,imageUrl);

@override
String toString() {
  return 'RecipeStepDto(stepOrder: $stepOrder, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $RecipeStepDtoCopyWith<$Res>  {
  factory $RecipeStepDtoCopyWith(RecipeStepDto value, $Res Function(RecipeStepDto) _then) = _$RecipeStepDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "step_order") int stepOrder, String description,@JsonKey(name: "image_url") String? imageUrl
});




}
/// @nodoc
class _$RecipeStepDtoCopyWithImpl<$Res>
    implements $RecipeStepDtoCopyWith<$Res> {
  _$RecipeStepDtoCopyWithImpl(this._self, this._then);

  final RecipeStepDto _self;
  final $Res Function(RecipeStepDto) _then;

/// Create a copy of RecipeStepDto
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


/// Adds pattern-matching-related methods to [RecipeStepDto].
extension RecipeStepDtoPatterns on RecipeStepDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeStepDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeStepDto value)  $default,){
final _that = this;
switch (_that) {
case _RecipeStepDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeStepDto value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "step_order")  int stepOrder,  String description, @JsonKey(name: "image_url")  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "step_order")  int stepOrder,  String description, @JsonKey(name: "image_url")  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _RecipeStepDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "step_order")  int stepOrder,  String description, @JsonKey(name: "image_url")  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
return $default(_that.stepOrder,_that.description,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeStepDto implements RecipeStepDto {
  const _RecipeStepDto({@JsonKey(name: "step_order") required this.stepOrder, required this.description, @JsonKey(name: "image_url") this.imageUrl});
  factory _RecipeStepDto.fromJson(Map<String, dynamic> json) => _$RecipeStepDtoFromJson(json);

@override@JsonKey(name: "step_order") final  int stepOrder;
@override final  String description;
@override@JsonKey(name: "image_url") final  String? imageUrl;

/// Create a copy of RecipeStepDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeStepDtoCopyWith<_RecipeStepDto> get copyWith => __$RecipeStepDtoCopyWithImpl<_RecipeStepDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeStepDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStepDto&&(identical(other.stepOrder, stepOrder) || other.stepOrder == stepOrder)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepOrder,description,imageUrl);

@override
String toString() {
  return 'RecipeStepDto(stepOrder: $stepOrder, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$RecipeStepDtoCopyWith<$Res> implements $RecipeStepDtoCopyWith<$Res> {
  factory _$RecipeStepDtoCopyWith(_RecipeStepDto value, $Res Function(_RecipeStepDto) _then) = __$RecipeStepDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "step_order") int stepOrder, String description,@JsonKey(name: "image_url") String? imageUrl
});




}
/// @nodoc
class __$RecipeStepDtoCopyWithImpl<$Res>
    implements _$RecipeStepDtoCopyWith<$Res> {
  __$RecipeStepDtoCopyWithImpl(this._self, this._then);

  final _RecipeStepDto _self;
  final $Res Function(_RecipeStepDto) _then;

/// Create a copy of RecipeStepDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepOrder = null,Object? description = null,Object? imageUrl = freezed,}) {
  return _then(_RecipeStepDto(
stepOrder: null == stepOrder ? _self.stepOrder : stepOrder // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
