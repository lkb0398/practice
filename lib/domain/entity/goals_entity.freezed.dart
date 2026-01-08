// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalsEntity {

 String? get userId; String? get goalId; String get goalTitle;// 목표명
 String get goalUnit;// 목표 단위
 double get goalValue;// 목표 수치
 DateTime get goalDate;// 목표 날짜
 bool get isDone;// 달성 여부
 bool get isMain;
/// Create a copy of GoalsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalsEntityCopyWith<GoalsEntity> get copyWith => _$GoalsEntityCopyWithImpl<GoalsEntity>(this as GoalsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.goalTitle, goalTitle) || other.goalTitle == goalTitle)&&(identical(other.goalUnit, goalUnit) || other.goalUnit == goalUnit)&&(identical(other.goalValue, goalValue) || other.goalValue == goalValue)&&(identical(other.goalDate, goalDate) || other.goalDate == goalDate)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.isMain, isMain) || other.isMain == isMain));
}


@override
int get hashCode => Object.hash(runtimeType,userId,goalId,goalTitle,goalUnit,goalValue,goalDate,isDone,isMain);

@override
String toString() {
  return 'GoalsEntity(userId: $userId, goalId: $goalId, goalTitle: $goalTitle, goalUnit: $goalUnit, goalValue: $goalValue, goalDate: $goalDate, isDone: $isDone, isMain: $isMain)';
}


}

/// @nodoc
abstract mixin class $GoalsEntityCopyWith<$Res>  {
  factory $GoalsEntityCopyWith(GoalsEntity value, $Res Function(GoalsEntity) _then) = _$GoalsEntityCopyWithImpl;
@useResult
$Res call({
 String? userId, String? goalId, String goalTitle, String goalUnit, double goalValue, DateTime goalDate, bool isDone, bool isMain
});




}
/// @nodoc
class _$GoalsEntityCopyWithImpl<$Res>
    implements $GoalsEntityCopyWith<$Res> {
  _$GoalsEntityCopyWithImpl(this._self, this._then);

  final GoalsEntity _self;
  final $Res Function(GoalsEntity) _then;

/// Create a copy of GoalsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? goalId = freezed,Object? goalTitle = null,Object? goalUnit = null,Object? goalValue = null,Object? goalDate = null,Object? isDone = null,Object? isMain = null,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,goalTitle: null == goalTitle ? _self.goalTitle : goalTitle // ignore: cast_nullable_to_non_nullable
as String,goalUnit: null == goalUnit ? _self.goalUnit : goalUnit // ignore: cast_nullable_to_non_nullable
as String,goalValue: null == goalValue ? _self.goalValue : goalValue // ignore: cast_nullable_to_non_nullable
as double,goalDate: null == goalDate ? _self.goalDate : goalDate // ignore: cast_nullable_to_non_nullable
as DateTime,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,isMain: null == isMain ? _self.isMain : isMain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalsEntity].
extension GoalsEntityPatterns on GoalsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalsEntity value)  $default,){
final _that = this;
switch (_that) {
case _GoalsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GoalsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId,  String? goalId,  String goalTitle,  String goalUnit,  double goalValue,  DateTime goalDate,  bool isDone,  bool isMain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalsEntity() when $default != null:
return $default(_that.userId,_that.goalId,_that.goalTitle,_that.goalUnit,_that.goalValue,_that.goalDate,_that.isDone,_that.isMain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId,  String? goalId,  String goalTitle,  String goalUnit,  double goalValue,  DateTime goalDate,  bool isDone,  bool isMain)  $default,) {final _that = this;
switch (_that) {
case _GoalsEntity():
return $default(_that.userId,_that.goalId,_that.goalTitle,_that.goalUnit,_that.goalValue,_that.goalDate,_that.isDone,_that.isMain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId,  String? goalId,  String goalTitle,  String goalUnit,  double goalValue,  DateTime goalDate,  bool isDone,  bool isMain)?  $default,) {final _that = this;
switch (_that) {
case _GoalsEntity() when $default != null:
return $default(_that.userId,_that.goalId,_that.goalTitle,_that.goalUnit,_that.goalValue,_that.goalDate,_that.isDone,_that.isMain);case _:
  return null;

}
}

}

/// @nodoc


class _GoalsEntity implements GoalsEntity {
  const _GoalsEntity({this.userId, this.goalId, required this.goalTitle, required this.goalUnit, required this.goalValue, required this.goalDate, required this.isDone, required this.isMain});
  

@override final  String? userId;
@override final  String? goalId;
@override final  String goalTitle;
// 목표명
@override final  String goalUnit;
// 목표 단위
@override final  double goalValue;
// 목표 수치
@override final  DateTime goalDate;
// 목표 날짜
@override final  bool isDone;
// 달성 여부
@override final  bool isMain;

/// Create a copy of GoalsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalsEntityCopyWith<_GoalsEntity> get copyWith => __$GoalsEntityCopyWithImpl<_GoalsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalsEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.goalTitle, goalTitle) || other.goalTitle == goalTitle)&&(identical(other.goalUnit, goalUnit) || other.goalUnit == goalUnit)&&(identical(other.goalValue, goalValue) || other.goalValue == goalValue)&&(identical(other.goalDate, goalDate) || other.goalDate == goalDate)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.isMain, isMain) || other.isMain == isMain));
}


@override
int get hashCode => Object.hash(runtimeType,userId,goalId,goalTitle,goalUnit,goalValue,goalDate,isDone,isMain);

@override
String toString() {
  return 'GoalsEntity(userId: $userId, goalId: $goalId, goalTitle: $goalTitle, goalUnit: $goalUnit, goalValue: $goalValue, goalDate: $goalDate, isDone: $isDone, isMain: $isMain)';
}


}

/// @nodoc
abstract mixin class _$GoalsEntityCopyWith<$Res> implements $GoalsEntityCopyWith<$Res> {
  factory _$GoalsEntityCopyWith(_GoalsEntity value, $Res Function(_GoalsEntity) _then) = __$GoalsEntityCopyWithImpl;
@override @useResult
$Res call({
 String? userId, String? goalId, String goalTitle, String goalUnit, double goalValue, DateTime goalDate, bool isDone, bool isMain
});




}
/// @nodoc
class __$GoalsEntityCopyWithImpl<$Res>
    implements _$GoalsEntityCopyWith<$Res> {
  __$GoalsEntityCopyWithImpl(this._self, this._then);

  final _GoalsEntity _self;
  final $Res Function(_GoalsEntity) _then;

/// Create a copy of GoalsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? goalId = freezed,Object? goalTitle = null,Object? goalUnit = null,Object? goalValue = null,Object? goalDate = null,Object? isDone = null,Object? isMain = null,}) {
  return _then(_GoalsEntity(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,goalTitle: null == goalTitle ? _self.goalTitle : goalTitle // ignore: cast_nullable_to_non_nullable
as String,goalUnit: null == goalUnit ? _self.goalUnit : goalUnit // ignore: cast_nullable_to_non_nullable
as String,goalValue: null == goalValue ? _self.goalValue : goalValue // ignore: cast_nullable_to_non_nullable
as double,goalDate: null == goalDate ? _self.goalDate : goalDate // ignore: cast_nullable_to_non_nullable
as DateTime,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,isMain: null == isMain ? _self.isMain : isMain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
