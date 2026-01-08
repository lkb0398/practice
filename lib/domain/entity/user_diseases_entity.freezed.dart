// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_diseases_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDiseasesEntity {

 String get userId; int get diseaseId;
/// Create a copy of UserDiseasesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDiseasesEntityCopyWith<UserDiseasesEntity> get copyWith => _$UserDiseasesEntityCopyWithImpl<UserDiseasesEntity>(this as UserDiseasesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDiseasesEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.diseaseId, diseaseId) || other.diseaseId == diseaseId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,diseaseId);

@override
String toString() {
  return 'UserDiseasesEntity(userId: $userId, diseaseId: $diseaseId)';
}


}

/// @nodoc
abstract mixin class $UserDiseasesEntityCopyWith<$Res>  {
  factory $UserDiseasesEntityCopyWith(UserDiseasesEntity value, $Res Function(UserDiseasesEntity) _then) = _$UserDiseasesEntityCopyWithImpl;
@useResult
$Res call({
 String userId, int diseaseId
});




}
/// @nodoc
class _$UserDiseasesEntityCopyWithImpl<$Res>
    implements $UserDiseasesEntityCopyWith<$Res> {
  _$UserDiseasesEntityCopyWithImpl(this._self, this._then);

  final UserDiseasesEntity _self;
  final $Res Function(UserDiseasesEntity) _then;

/// Create a copy of UserDiseasesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? diseaseId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,diseaseId: null == diseaseId ? _self.diseaseId : diseaseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDiseasesEntity].
extension UserDiseasesEntityPatterns on UserDiseasesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDiseasesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDiseasesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDiseasesEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserDiseasesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDiseasesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserDiseasesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  int diseaseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDiseasesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  int diseaseId)  $default,) {final _that = this;
switch (_that) {
case _UserDiseasesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  int diseaseId)?  $default,) {final _that = this;
switch (_that) {
case _UserDiseasesEntity() when $default != null:
return $default(_that.userId,_that.diseaseId);case _:
  return null;

}
}

}

/// @nodoc


class _UserDiseasesEntity implements UserDiseasesEntity {
  const _UserDiseasesEntity({required this.userId, required this.diseaseId});
  

@override final  String userId;
@override final  int diseaseId;

/// Create a copy of UserDiseasesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDiseasesEntityCopyWith<_UserDiseasesEntity> get copyWith => __$UserDiseasesEntityCopyWithImpl<_UserDiseasesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDiseasesEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.diseaseId, diseaseId) || other.diseaseId == diseaseId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,diseaseId);

@override
String toString() {
  return 'UserDiseasesEntity(userId: $userId, diseaseId: $diseaseId)';
}


}

/// @nodoc
abstract mixin class _$UserDiseasesEntityCopyWith<$Res> implements $UserDiseasesEntityCopyWith<$Res> {
  factory _$UserDiseasesEntityCopyWith(_UserDiseasesEntity value, $Res Function(_UserDiseasesEntity) _then) = __$UserDiseasesEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, int diseaseId
});




}
/// @nodoc
class __$UserDiseasesEntityCopyWithImpl<$Res>
    implements _$UserDiseasesEntityCopyWith<$Res> {
  __$UserDiseasesEntityCopyWithImpl(this._self, this._then);

  final _UserDiseasesEntity _self;
  final $Res Function(_UserDiseasesEntity) _then;

/// Create a copy of UserDiseasesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? diseaseId = null,}) {
  return _then(_UserDiseasesEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,diseaseId: null == diseaseId ? _self.diseaseId : diseaseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
