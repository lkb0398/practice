// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_datas_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalDatasDto {

@JsonKey(name: 'goal_id') String? get goalId;@JsonKey(name: 'data_id') String? get dataId;@JsonKey(name: 'data_date') String get dataDate;@JsonKey(name: 'data_value') double get dataValue;
/// Create a copy of GoalDatasDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalDatasDtoCopyWith<GoalDatasDto> get copyWith => _$GoalDatasDtoCopyWithImpl<GoalDatasDto>(this as GoalDatasDto, _$identity);

  /// Serializes this GoalDatasDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalDatasDto&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.dataId, dataId) || other.dataId == dataId)&&(identical(other.dataDate, dataDate) || other.dataDate == dataDate)&&(identical(other.dataValue, dataValue) || other.dataValue == dataValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goalId,dataId,dataDate,dataValue);

@override
String toString() {
  return 'GoalDatasDto(goalId: $goalId, dataId: $dataId, dataDate: $dataDate, dataValue: $dataValue)';
}


}

/// @nodoc
abstract mixin class $GoalDatasDtoCopyWith<$Res>  {
  factory $GoalDatasDtoCopyWith(GoalDatasDto value, $Res Function(GoalDatasDto) _then) = _$GoalDatasDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'goal_id') String? goalId,@JsonKey(name: 'data_id') String? dataId,@JsonKey(name: 'data_date') String dataDate,@JsonKey(name: 'data_value') double dataValue
});




}
/// @nodoc
class _$GoalDatasDtoCopyWithImpl<$Res>
    implements $GoalDatasDtoCopyWith<$Res> {
  _$GoalDatasDtoCopyWithImpl(this._self, this._then);

  final GoalDatasDto _self;
  final $Res Function(GoalDatasDto) _then;

/// Create a copy of GoalDatasDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goalId = freezed,Object? dataId = freezed,Object? dataDate = null,Object? dataValue = null,}) {
  return _then(_self.copyWith(
goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,dataId: freezed == dataId ? _self.dataId : dataId // ignore: cast_nullable_to_non_nullable
as String?,dataDate: null == dataDate ? _self.dataDate : dataDate // ignore: cast_nullable_to_non_nullable
as String,dataValue: null == dataValue ? _self.dataValue : dataValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalDatasDto].
extension GoalDatasDtoPatterns on GoalDatasDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalDatasDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalDatasDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalDatasDto value)  $default,){
final _that = this;
switch (_that) {
case _GoalDatasDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalDatasDto value)?  $default,){
final _that = this;
switch (_that) {
case _GoalDatasDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'goal_id')  String? goalId, @JsonKey(name: 'data_id')  String? dataId, @JsonKey(name: 'data_date')  String dataDate, @JsonKey(name: 'data_value')  double dataValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalDatasDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'goal_id')  String? goalId, @JsonKey(name: 'data_id')  String? dataId, @JsonKey(name: 'data_date')  String dataDate, @JsonKey(name: 'data_value')  double dataValue)  $default,) {final _that = this;
switch (_that) {
case _GoalDatasDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'goal_id')  String? goalId, @JsonKey(name: 'data_id')  String? dataId, @JsonKey(name: 'data_date')  String dataDate, @JsonKey(name: 'data_value')  double dataValue)?  $default,) {final _that = this;
switch (_that) {
case _GoalDatasDto() when $default != null:
return $default(_that.goalId,_that.dataId,_that.dataDate,_that.dataValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalDatasDto implements GoalDatasDto {
  const _GoalDatasDto({@JsonKey(name: 'goal_id') this.goalId, @JsonKey(name: 'data_id') this.dataId, @JsonKey(name: 'data_date') required this.dataDate, @JsonKey(name: 'data_value') required this.dataValue});
  factory _GoalDatasDto.fromJson(Map<String, dynamic> json) => _$GoalDatasDtoFromJson(json);

@override@JsonKey(name: 'goal_id') final  String? goalId;
@override@JsonKey(name: 'data_id') final  String? dataId;
@override@JsonKey(name: 'data_date') final  String dataDate;
@override@JsonKey(name: 'data_value') final  double dataValue;

/// Create a copy of GoalDatasDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalDatasDtoCopyWith<_GoalDatasDto> get copyWith => __$GoalDatasDtoCopyWithImpl<_GoalDatasDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalDatasDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalDatasDto&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.dataId, dataId) || other.dataId == dataId)&&(identical(other.dataDate, dataDate) || other.dataDate == dataDate)&&(identical(other.dataValue, dataValue) || other.dataValue == dataValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goalId,dataId,dataDate,dataValue);

@override
String toString() {
  return 'GoalDatasDto(goalId: $goalId, dataId: $dataId, dataDate: $dataDate, dataValue: $dataValue)';
}


}

/// @nodoc
abstract mixin class _$GoalDatasDtoCopyWith<$Res> implements $GoalDatasDtoCopyWith<$Res> {
  factory _$GoalDatasDtoCopyWith(_GoalDatasDto value, $Res Function(_GoalDatasDto) _then) = __$GoalDatasDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'goal_id') String? goalId,@JsonKey(name: 'data_id') String? dataId,@JsonKey(name: 'data_date') String dataDate,@JsonKey(name: 'data_value') double dataValue
});




}
/// @nodoc
class __$GoalDatasDtoCopyWithImpl<$Res>
    implements _$GoalDatasDtoCopyWith<$Res> {
  __$GoalDatasDtoCopyWithImpl(this._self, this._then);

  final _GoalDatasDto _self;
  final $Res Function(_GoalDatasDto) _then;

/// Create a copy of GoalDatasDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goalId = freezed,Object? dataId = freezed,Object? dataDate = null,Object? dataValue = null,}) {
  return _then(_GoalDatasDto(
goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,dataId: freezed == dataId ? _self.dataId : dataId // ignore: cast_nullable_to_non_nullable
as String?,dataDate: null == dataDate ? _self.dataDate : dataDate // ignore: cast_nullable_to_non_nullable
as String,dataValue: null == dataValue ? _self.dataValue : dataValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
