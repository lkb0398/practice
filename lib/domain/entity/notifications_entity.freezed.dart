// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsEntity {

 String? get userId; String? get notiId; String get label; TimeOfDay get time; bool get isEnabled; String get timezone; DateTime get nextFireAt;
/// Create a copy of NotificationsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsEntityCopyWith<NotificationsEntity> get copyWith => _$NotificationsEntityCopyWithImpl<NotificationsEntity>(this as NotificationsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.notiId, notiId) || other.notiId == notiId)&&(identical(other.label, label) || other.label == label)&&(identical(other.time, time) || other.time == time)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.nextFireAt, nextFireAt) || other.nextFireAt == nextFireAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,notiId,label,time,isEnabled,timezone,nextFireAt);

@override
String toString() {
  return 'NotificationsEntity(userId: $userId, notiId: $notiId, label: $label, time: $time, isEnabled: $isEnabled, timezone: $timezone, nextFireAt: $nextFireAt)';
}


}

/// @nodoc
abstract mixin class $NotificationsEntityCopyWith<$Res>  {
  factory $NotificationsEntityCopyWith(NotificationsEntity value, $Res Function(NotificationsEntity) _then) = _$NotificationsEntityCopyWithImpl;
@useResult
$Res call({
 String? userId, String? notiId, String label, TimeOfDay time, bool isEnabled, String timezone, DateTime nextFireAt
});




}
/// @nodoc
class _$NotificationsEntityCopyWithImpl<$Res>
    implements $NotificationsEntityCopyWith<$Res> {
  _$NotificationsEntityCopyWithImpl(this._self, this._then);

  final NotificationsEntity _self;
  final $Res Function(NotificationsEntity) _then;

/// Create a copy of NotificationsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? notiId = freezed,Object? label = null,Object? time = null,Object? isEnabled = null,Object? timezone = null,Object? nextFireAt = null,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,notiId: freezed == notiId ? _self.notiId : notiId // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,nextFireAt: null == nextFireAt ? _self.nextFireAt : nextFireAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsEntity].
extension NotificationsEntityPatterns on NotificationsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsEntity value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId,  String? notiId,  String label,  TimeOfDay time,  bool isEnabled,  String timezone,  DateTime nextFireAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsEntity() when $default != null:
return $default(_that.userId,_that.notiId,_that.label,_that.time,_that.isEnabled,_that.timezone,_that.nextFireAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId,  String? notiId,  String label,  TimeOfDay time,  bool isEnabled,  String timezone,  DateTime nextFireAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationsEntity():
return $default(_that.userId,_that.notiId,_that.label,_that.time,_that.isEnabled,_that.timezone,_that.nextFireAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId,  String? notiId,  String label,  TimeOfDay time,  bool isEnabled,  String timezone,  DateTime nextFireAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsEntity() when $default != null:
return $default(_that.userId,_that.notiId,_that.label,_that.time,_that.isEnabled,_that.timezone,_that.nextFireAt);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsEntity implements NotificationsEntity {
  const _NotificationsEntity({this.userId, this.notiId, required this.label, required this.time, required this.isEnabled, required this.timezone, required this.nextFireAt});
  

@override final  String? userId;
@override final  String? notiId;
@override final  String label;
@override final  TimeOfDay time;
@override final  bool isEnabled;
@override final  String timezone;
@override final  DateTime nextFireAt;

/// Create a copy of NotificationsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsEntityCopyWith<_NotificationsEntity> get copyWith => __$NotificationsEntityCopyWithImpl<_NotificationsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.notiId, notiId) || other.notiId == notiId)&&(identical(other.label, label) || other.label == label)&&(identical(other.time, time) || other.time == time)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.nextFireAt, nextFireAt) || other.nextFireAt == nextFireAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,notiId,label,time,isEnabled,timezone,nextFireAt);

@override
String toString() {
  return 'NotificationsEntity(userId: $userId, notiId: $notiId, label: $label, time: $time, isEnabled: $isEnabled, timezone: $timezone, nextFireAt: $nextFireAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationsEntityCopyWith<$Res> implements $NotificationsEntityCopyWith<$Res> {
  factory _$NotificationsEntityCopyWith(_NotificationsEntity value, $Res Function(_NotificationsEntity) _then) = __$NotificationsEntityCopyWithImpl;
@override @useResult
$Res call({
 String? userId, String? notiId, String label, TimeOfDay time, bool isEnabled, String timezone, DateTime nextFireAt
});




}
/// @nodoc
class __$NotificationsEntityCopyWithImpl<$Res>
    implements _$NotificationsEntityCopyWith<$Res> {
  __$NotificationsEntityCopyWithImpl(this._self, this._then);

  final _NotificationsEntity _self;
  final $Res Function(_NotificationsEntity) _then;

/// Create a copy of NotificationsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? notiId = freezed,Object? label = null,Object? time = null,Object? isEnabled = null,Object? timezone = null,Object? nextFireAt = null,}) {
  return _then(_NotificationsEntity(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,notiId: freezed == notiId ? _self.notiId : notiId // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,nextFireAt: null == nextFireAt ? _self.nextFireAt : nextFireAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
