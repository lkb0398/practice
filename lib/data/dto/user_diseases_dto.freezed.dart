// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_diseases_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDiseasesDto {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'disease_id') int get diseaseId;
/// Create a copy of UserDiseasesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDiseasesDtoCopyWith<UserDiseasesDto> get copyWith => _$UserDiseasesDtoCopyWithImpl<UserDiseasesDto>(this as UserDiseasesDto, _$identity);

  /// Serializes this UserDiseasesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDiseasesDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.diseaseId, diseaseId) || other.diseaseId == diseaseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,diseaseId);

@override
String toString() {
  return 'UserDiseasesDto(userId: $userId, diseaseId: $diseaseId)';
}


}

/// @nodoc
abstract mixin class $UserDiseasesDtoCopyWith<$Res>  {
  factory $UserDiseasesDtoCopyWith(UserDiseasesDto value, $Res Function(UserDiseasesDto) _then) = _$UserDiseasesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'disease_id') int diseaseId
});




}
/// @nodoc
class _$UserDiseasesDtoCopyWithImpl<$Res>
    implements $UserDiseasesDtoCopyWith<$Res> {
  _$UserDiseasesDtoCopyWithImpl(this._self, this._then);

  final UserDiseasesDto _self;
  final $Res Function(UserDiseasesDto) _then;

/// Create a copy of UserDiseasesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? diseaseId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,diseaseId: null == diseaseId ? _self.diseaseId : diseaseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDiseasesDto].
extension UserDiseasesDtoPatterns on UserDiseasesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDiseasesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDiseasesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDiseasesDto value)  $default,){
final _that = this;
switch (_that) {
case _UserDiseasesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDiseasesDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserDiseasesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'disease_id')  int diseaseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDiseasesDto() when $default != null:
return $default(_that.userId,_that.diseaseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'disease_id')  int diseaseId)  $default,) {final _that = this;
switch (_that) {
case _UserDiseasesDto():
return $default(_that.userId,_that.diseaseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'disease_id')  int diseaseId)?  $default,) {final _that = this;
switch (_that) {
case _UserDiseasesDto() when $default != null:
return $default(_that.userId,_that.diseaseId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDiseasesDto implements UserDiseasesDto {
  const _UserDiseasesDto({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'disease_id') required this.diseaseId});
  factory _UserDiseasesDto.fromJson(Map<String, dynamic> json) => _$UserDiseasesDtoFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'disease_id') final  int diseaseId;

/// Create a copy of UserDiseasesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDiseasesDtoCopyWith<_UserDiseasesDto> get copyWith => __$UserDiseasesDtoCopyWithImpl<_UserDiseasesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDiseasesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDiseasesDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.diseaseId, diseaseId) || other.diseaseId == diseaseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,diseaseId);

@override
String toString() {
  return 'UserDiseasesDto(userId: $userId, diseaseId: $diseaseId)';
}


}

/// @nodoc
abstract mixin class _$UserDiseasesDtoCopyWith<$Res> implements $UserDiseasesDtoCopyWith<$Res> {
  factory _$UserDiseasesDtoCopyWith(_UserDiseasesDto value, $Res Function(_UserDiseasesDto) _then) = __$UserDiseasesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'disease_id') int diseaseId
});




}
/// @nodoc
class __$UserDiseasesDtoCopyWithImpl<$Res>
    implements _$UserDiseasesDtoCopyWith<$Res> {
  __$UserDiseasesDtoCopyWithImpl(this._self, this._then);

  final _UserDiseasesDto _self;
  final $Res Function(_UserDiseasesDto) _then;

/// Create a copy of UserDiseasesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? diseaseId = null,}) {
  return _then(_UserDiseasesDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,diseaseId: null == diseaseId ? _self.diseaseId : diseaseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
