// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_datas_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalDatasEntity {

 String? get goalId; String? get dataId; DateTime get dataDate;// 데이터 날짜
 double get dataValue;
/// Create a copy of GoalDatasEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalDatasEntityCopyWith<GoalDatasEntity> get copyWith => _$GoalDatasEntityCopyWithImpl<GoalDatasEntity>(this as GoalDatasEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalDatasEntity&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.dataId, dataId) || other.dataId == dataId)&&(identical(other.dataDate, dataDate) || other.dataDate == dataDate)&&(identical(other.dataValue, dataValue) || other.dataValue == dataValue));
}


@override
int get hashCode => Object.hash(runtimeType,goalId,dataId,dataDate,dataValue);

@override
String toString() {
  return 'GoalDatasEntity(goalId: $goalId, dataId: $dataId, dataDate: $dataDate, dataValue: $dataValue)';
}


}

/// @nodoc
abstract mixin class $GoalDatasEntityCopyWith<$Res>  {
  factory $GoalDatasEntityCopyWith(GoalDatasEntity value, $Res Function(GoalDatasEntity) _then) = _$GoalDatasEntityCopyWithImpl;
@useResult
$Res call({
 String? goalId, String? dataId, DateTime dataDate, double dataValue
});




}
/// @nodoc
class _$GoalDatasEntityCopyWithImpl<$Res>
    implements $GoalDatasEntityCopyWith<$Res> {
  _$GoalDatasEntityCopyWithImpl(this._self, this._then);

  final GoalDatasEntity _self;
  final $Res Function(GoalDatasEntity) _then;

/// Create a copy of GoalDatasEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goalId = freezed,Object? dataId = freezed,Object? dataDate = null,Object? dataValue = null,}) {
  return _then(_self.copyWith(
goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,dataId: freezed == dataId ? _self.dataId : dataId // ignore: cast_nullable_to_non_nullable
as String?,dataDate: null == dataDate ? _self.dataDate : dataDate // ignore: cast_nullable_to_non_nullable
as DateTime,dataValue: null == dataValue ? _self.dataValue : dataValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalDatasEntity].
extension GoalDatasEntityPatterns on GoalDatasEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalDatasEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalDatasEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalDatasEntity value)  $default,){
final _that = this;
switch (_that) {
case _GoalDatasEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalDatasEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GoalDatasEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? goalId,  String? dataId,  DateTime dataDate,  double dataValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalDatasEntity() when $default != null:
return $default(_that.goalId,_that.dataId,_that.dataDate,_that.dataValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? goalId,  String? dataId,  DateTime dataDate,  double dataValue)  $default,) {final _that = this;
switch (_that) {
case _GoalDatasEntity():
return $default(_that.goalId,_that.dataId,_that.dataDate,_that.dataValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? goalId,  String? dataId,  DateTime dataDate,  double dataValue)?  $default,) {final _that = this;
switch (_that) {
case _GoalDatasEntity() when $default != null:
return $default(_that.goalId,_that.dataId,_that.dataDate,_that.dataValue);case _:
  return null;

}
}

}

/// @nodoc


class _GoalDatasEntity implements GoalDatasEntity {
  const _GoalDatasEntity({this.goalId, this.dataId, required this.dataDate, required this.dataValue});
  

@override final  String? goalId;
@override final  String? dataId;
@override final  DateTime dataDate;
// 데이터 날짜
@override final  double dataValue;

/// Create a copy of GoalDatasEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalDatasEntityCopyWith<_GoalDatasEntity> get copyWith => __$GoalDatasEntityCopyWithImpl<_GoalDatasEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalDatasEntity&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.dataId, dataId) || other.dataId == dataId)&&(identical(other.dataDate, dataDate) || other.dataDate == dataDate)&&(identical(other.dataValue, dataValue) || other.dataValue == dataValue));
}


@override
int get hashCode => Object.hash(runtimeType,goalId,dataId,dataDate,dataValue);

@override
String toString() {
  return 'GoalDatasEntity(goalId: $goalId, dataId: $dataId, dataDate: $dataDate, dataValue: $dataValue)';
}


}

/// @nodoc
abstract mixin class _$GoalDatasEntityCopyWith<$Res> implements $GoalDatasEntityCopyWith<$Res> {
  factory _$GoalDatasEntityCopyWith(_GoalDatasEntity value, $Res Function(_GoalDatasEntity) _then) = __$GoalDatasEntityCopyWithImpl;
@override @useResult
$Res call({
 String? goalId, String? dataId, DateTime dataDate, double dataValue
});




}
/// @nodoc
class __$GoalDatasEntityCopyWithImpl<$Res>
    implements _$GoalDatasEntityCopyWith<$Res> {
  __$GoalDatasEntityCopyWithImpl(this._self, this._then);

  final _GoalDatasEntity _self;
  final $Res Function(_GoalDatasEntity) _then;

/// Create a copy of GoalDatasEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goalId = freezed,Object? dataId = freezed,Object? dataDate = null,Object? dataValue = null,}) {
  return _then(_GoalDatasEntity(
goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,dataId: freezed == dataId ? _self.dataId : dataId // ignore: cast_nullable_to_non_nullable
as String?,dataDate: null == dataDate ? _self.dataDate : dataDate // ignore: cast_nullable_to_non_nullable
as DateTime,dataValue: null == dataValue ? _self.dataValue : dataValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
