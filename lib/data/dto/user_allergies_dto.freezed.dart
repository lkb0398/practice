// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_allergies_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAllergiesDto {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'allergy_id') int get allergyId;
/// Create a copy of UserAllergiesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAllergiesDtoCopyWith<UserAllergiesDto> get copyWith => _$UserAllergiesDtoCopyWithImpl<UserAllergiesDto>(this as UserAllergiesDto, _$identity);

  /// Serializes this UserAllergiesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAllergiesDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.allergyId, allergyId) || other.allergyId == allergyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,allergyId);

@override
String toString() {
  return 'UserAllergiesDto(userId: $userId, allergyId: $allergyId)';
}


}

/// @nodoc
abstract mixin class $UserAllergiesDtoCopyWith<$Res>  {
  factory $UserAllergiesDtoCopyWith(UserAllergiesDto value, $Res Function(UserAllergiesDto) _then) = _$UserAllergiesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'allergy_id') int allergyId
});




}
/// @nodoc
class _$UserAllergiesDtoCopyWithImpl<$Res>
    implements $UserAllergiesDtoCopyWith<$Res> {
  _$UserAllergiesDtoCopyWithImpl(this._self, this._then);

  final UserAllergiesDto _self;
  final $Res Function(UserAllergiesDto) _then;

/// Create a copy of UserAllergiesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? allergyId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,allergyId: null == allergyId ? _self.allergyId : allergyId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAllergiesDto].
extension UserAllergiesDtoPatterns on UserAllergiesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAllergiesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAllergiesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAllergiesDto value)  $default,){
final _that = this;
switch (_that) {
case _UserAllergiesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAllergiesDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserAllergiesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'allergy_id')  int allergyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAllergiesDto() when $default != null:
return $default(_that.userId,_that.allergyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'allergy_id')  int allergyId)  $default,) {final _that = this;
switch (_that) {
case _UserAllergiesDto():
return $default(_that.userId,_that.allergyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'allergy_id')  int allergyId)?  $default,) {final _that = this;
switch (_that) {
case _UserAllergiesDto() when $default != null:
return $default(_that.userId,_that.allergyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAllergiesDto implements UserAllergiesDto {
  const _UserAllergiesDto({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'allergy_id') required this.allergyId});
  factory _UserAllergiesDto.fromJson(Map<String, dynamic> json) => _$UserAllergiesDtoFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'allergy_id') final  int allergyId;

/// Create a copy of UserAllergiesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAllergiesDtoCopyWith<_UserAllergiesDto> get copyWith => __$UserAllergiesDtoCopyWithImpl<_UserAllergiesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAllergiesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAllergiesDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.allergyId, allergyId) || other.allergyId == allergyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,allergyId);

@override
String toString() {
  return 'UserAllergiesDto(userId: $userId, allergyId: $allergyId)';
}


}

/// @nodoc
abstract mixin class _$UserAllergiesDtoCopyWith<$Res> implements $UserAllergiesDtoCopyWith<$Res> {
  factory _$UserAllergiesDtoCopyWith(_UserAllergiesDto value, $Res Function(_UserAllergiesDto) _then) = __$UserAllergiesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'allergy_id') int allergyId
});




}
/// @nodoc
class __$UserAllergiesDtoCopyWithImpl<$Res>
    implements _$UserAllergiesDtoCopyWith<$Res> {
  __$UserAllergiesDtoCopyWithImpl(this._self, this._then);

  final _UserAllergiesDto _self;
  final $Res Function(_UserAllergiesDto) _then;

/// Create a copy of UserAllergiesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? allergyId = null,}) {
  return _then(_UserAllergiesDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,allergyId: null == allergyId ? _self.allergyId : allergyId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
