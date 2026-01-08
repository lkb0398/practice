// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_allergies_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserAllergiesEntity {

 String get userId; int get allergyId;
/// Create a copy of UserAllergiesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAllergiesEntityCopyWith<UserAllergiesEntity> get copyWith => _$UserAllergiesEntityCopyWithImpl<UserAllergiesEntity>(this as UserAllergiesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAllergiesEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.allergyId, allergyId) || other.allergyId == allergyId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,allergyId);

@override
String toString() {
  return 'UserAllergiesEntity(userId: $userId, allergyId: $allergyId)';
}


}

/// @nodoc
abstract mixin class $UserAllergiesEntityCopyWith<$Res>  {
  factory $UserAllergiesEntityCopyWith(UserAllergiesEntity value, $Res Function(UserAllergiesEntity) _then) = _$UserAllergiesEntityCopyWithImpl;
@useResult
$Res call({
 String userId, int allergyId
});




}
/// @nodoc
class _$UserAllergiesEntityCopyWithImpl<$Res>
    implements $UserAllergiesEntityCopyWith<$Res> {
  _$UserAllergiesEntityCopyWithImpl(this._self, this._then);

  final UserAllergiesEntity _self;
  final $Res Function(UserAllergiesEntity) _then;

/// Create a copy of UserAllergiesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? allergyId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,allergyId: null == allergyId ? _self.allergyId : allergyId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAllergiesEntity].
extension UserAllergiesEntityPatterns on UserAllergiesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAllergiesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAllergiesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAllergiesEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserAllergiesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAllergiesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserAllergiesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  int allergyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAllergiesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  int allergyId)  $default,) {final _that = this;
switch (_that) {
case _UserAllergiesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  int allergyId)?  $default,) {final _that = this;
switch (_that) {
case _UserAllergiesEntity() when $default != null:
return $default(_that.userId,_that.allergyId);case _:
  return null;

}
}

}

/// @nodoc


class _UserAllergiesEntity implements UserAllergiesEntity {
  const _UserAllergiesEntity({required this.userId, required this.allergyId});
  

@override final  String userId;
@override final  int allergyId;

/// Create a copy of UserAllergiesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAllergiesEntityCopyWith<_UserAllergiesEntity> get copyWith => __$UserAllergiesEntityCopyWithImpl<_UserAllergiesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAllergiesEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.allergyId, allergyId) || other.allergyId == allergyId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,allergyId);

@override
String toString() {
  return 'UserAllergiesEntity(userId: $userId, allergyId: $allergyId)';
}


}

/// @nodoc
abstract mixin class _$UserAllergiesEntityCopyWith<$Res> implements $UserAllergiesEntityCopyWith<$Res> {
  factory _$UserAllergiesEntityCopyWith(_UserAllergiesEntity value, $Res Function(_UserAllergiesEntity) _then) = __$UserAllergiesEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, int allergyId
});




}
/// @nodoc
class __$UserAllergiesEntityCopyWithImpl<$Res>
    implements _$UserAllergiesEntityCopyWith<$Res> {
  __$UserAllergiesEntityCopyWithImpl(this._self, this._then);

  final _UserAllergiesEntity _self;
  final $Res Function(_UserAllergiesEntity) _then;

/// Create a copy of UserAllergiesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? allergyId = null,}) {
  return _then(_UserAllergiesEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,allergyId: null == allergyId ? _self.allergyId : allergyId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
