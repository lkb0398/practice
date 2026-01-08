// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsDto {

@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'noti_id') String? get notiId; String get label; String get time;@JsonKey(name: 'is_enabled') bool get isEnabled; String get timezone;@JsonKey(name: 'next_fire_at') String get nextFireAt;
/// Create a copy of NotificationsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsDtoCopyWith<NotificationsDto> get copyWith => _$NotificationsDtoCopyWithImpl<NotificationsDto>(this as NotificationsDto, _$identity);

  /// Serializes this NotificationsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.notiId, notiId) || other.notiId == notiId)&&(identical(other.label, label) || other.label == label)&&(identical(other.time, time) || other.time == time)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.nextFireAt, nextFireAt) || other.nextFireAt == nextFireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,notiId,label,time,isEnabled,timezone,nextFireAt);

@override
String toString() {
  return 'NotificationsDto(userId: $userId, notiId: $notiId, label: $label, time: $time, isEnabled: $isEnabled, timezone: $timezone, nextFireAt: $nextFireAt)';
}


}

/// @nodoc
abstract mixin class $NotificationsDtoCopyWith<$Res>  {
  factory $NotificationsDtoCopyWith(NotificationsDto value, $Res Function(NotificationsDto) _then) = _$NotificationsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'noti_id') String? notiId, String label, String time,@JsonKey(name: 'is_enabled') bool isEnabled, String timezone,@JsonKey(name: 'next_fire_at') String nextFireAt
});




}
/// @nodoc
class _$NotificationsDtoCopyWithImpl<$Res>
    implements $NotificationsDtoCopyWith<$Res> {
  _$NotificationsDtoCopyWithImpl(this._self, this._then);

  final NotificationsDto _self;
  final $Res Function(NotificationsDto) _then;

/// Create a copy of NotificationsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? notiId = freezed,Object? label = null,Object? time = null,Object? isEnabled = null,Object? timezone = null,Object? nextFireAt = null,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,notiId: freezed == notiId ? _self.notiId : notiId // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,nextFireAt: null == nextFireAt ? _self.nextFireAt : nextFireAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsDto].
extension NotificationsDtoPatterns on NotificationsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'noti_id')  String? notiId,  String label,  String time, @JsonKey(name: 'is_enabled')  bool isEnabled,  String timezone, @JsonKey(name: 'next_fire_at')  String nextFireAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'noti_id')  String? notiId,  String label,  String time, @JsonKey(name: 'is_enabled')  bool isEnabled,  String timezone, @JsonKey(name: 'next_fire_at')  String nextFireAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'noti_id')  String? notiId,  String label,  String time, @JsonKey(name: 'is_enabled')  bool isEnabled,  String timezone, @JsonKey(name: 'next_fire_at')  String nextFireAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsDto() when $default != null:
return $default(_that.userId,_that.notiId,_that.label,_that.time,_that.isEnabled,_that.timezone,_that.nextFireAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationsDto implements NotificationsDto {
  const _NotificationsDto({@JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'noti_id') this.notiId, required this.label, required this.time, @JsonKey(name: 'is_enabled') required this.isEnabled, required this.timezone, @JsonKey(name: 'next_fire_at') required this.nextFireAt});
  factory _NotificationsDto.fromJson(Map<String, dynamic> json) => _$NotificationsDtoFromJson(json);

@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'noti_id') final  String? notiId;
@override final  String label;
@override final  String time;
@override@JsonKey(name: 'is_enabled') final  bool isEnabled;
@override final  String timezone;
@override@JsonKey(name: 'next_fire_at') final  String nextFireAt;

/// Create a copy of NotificationsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsDtoCopyWith<_NotificationsDto> get copyWith => __$NotificationsDtoCopyWithImpl<_NotificationsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.notiId, notiId) || other.notiId == notiId)&&(identical(other.label, label) || other.label == label)&&(identical(other.time, time) || other.time == time)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.nextFireAt, nextFireAt) || other.nextFireAt == nextFireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,notiId,label,time,isEnabled,timezone,nextFireAt);

@override
String toString() {
  return 'NotificationsDto(userId: $userId, notiId: $notiId, label: $label, time: $time, isEnabled: $isEnabled, timezone: $timezone, nextFireAt: $nextFireAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationsDtoCopyWith<$Res> implements $NotificationsDtoCopyWith<$Res> {
  factory _$NotificationsDtoCopyWith(_NotificationsDto value, $Res Function(_NotificationsDto) _then) = __$NotificationsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'noti_id') String? notiId, String label, String time,@JsonKey(name: 'is_enabled') bool isEnabled, String timezone,@JsonKey(name: 'next_fire_at') String nextFireAt
});




}
/// @nodoc
class __$NotificationsDtoCopyWithImpl<$Res>
    implements _$NotificationsDtoCopyWith<$Res> {
  __$NotificationsDtoCopyWithImpl(this._self, this._then);

  final _NotificationsDto _self;
  final $Res Function(_NotificationsDto) _then;

/// Create a copy of NotificationsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? notiId = freezed,Object? label = null,Object? time = null,Object? isEnabled = null,Object? timezone = null,Object? nextFireAt = null,}) {
  return _then(_NotificationsDto(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,notiId: freezed == notiId ? _self.notiId : notiId // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,nextFireAt: null == nextFireAt ? _self.nextFireAt : nextFireAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
