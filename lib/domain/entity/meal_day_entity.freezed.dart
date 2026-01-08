// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_day_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealDayEntity {

 String get id;// id
 String get userId;// 사용자 id
 DateTime get mealDate;// 날짜  
 AdherenceLevel? get adherence;// 성취도 자가평가
 DateTime get createdAt;// 생성한 날짜
 DateTime get updatedAt;// 수정한 날짜
 int get dataVersion;// 버전 (서버의 트리거를 통해 생성/수정시 증가)
 DateTime? get lastEntryUpdatedAt;// 마지막으로 식단 업데이트한 날짜 (식단만 다룸)
 bool get needsAiRefresh;// AI 분석 버튼 활성화 필요
 String? get latestAiSummary;// 가장 최근 AI 분석 내용 요약
 DateTime? get deletedAt;
/// Create a copy of MealDayEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealDayEntityCopyWith<MealDayEntity> get copyWith => _$MealDayEntityCopyWithImpl<MealDayEntity>(this as MealDayEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealDayEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mealDate, mealDate) || other.mealDate == mealDate)&&(identical(other.adherence, adherence) || other.adherence == adherence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dataVersion, dataVersion) || other.dataVersion == dataVersion)&&(identical(other.lastEntryUpdatedAt, lastEntryUpdatedAt) || other.lastEntryUpdatedAt == lastEntryUpdatedAt)&&(identical(other.needsAiRefresh, needsAiRefresh) || other.needsAiRefresh == needsAiRefresh)&&(identical(other.latestAiSummary, latestAiSummary) || other.latestAiSummary == latestAiSummary)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,mealDate,adherence,createdAt,updatedAt,dataVersion,lastEntryUpdatedAt,needsAiRefresh,latestAiSummary,deletedAt);

@override
String toString() {
  return 'MealDayEntity(id: $id, userId: $userId, mealDate: $mealDate, adherence: $adherence, createdAt: $createdAt, updatedAt: $updatedAt, dataVersion: $dataVersion, lastEntryUpdatedAt: $lastEntryUpdatedAt, needsAiRefresh: $needsAiRefresh, latestAiSummary: $latestAiSummary, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MealDayEntityCopyWith<$Res>  {
  factory $MealDayEntityCopyWith(MealDayEntity value, $Res Function(MealDayEntity) _then) = _$MealDayEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime mealDate, AdherenceLevel? adherence, DateTime createdAt, DateTime updatedAt, int dataVersion, DateTime? lastEntryUpdatedAt, bool needsAiRefresh, String? latestAiSummary, DateTime? deletedAt
});




}
/// @nodoc
class _$MealDayEntityCopyWithImpl<$Res>
    implements $MealDayEntityCopyWith<$Res> {
  _$MealDayEntityCopyWithImpl(this._self, this._then);

  final MealDayEntity _self;
  final $Res Function(MealDayEntity) _then;

/// Create a copy of MealDayEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? mealDate = null,Object? adherence = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dataVersion = null,Object? lastEntryUpdatedAt = freezed,Object? needsAiRefresh = null,Object? latestAiSummary = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,mealDate: null == mealDate ? _self.mealDate : mealDate // ignore: cast_nullable_to_non_nullable
as DateTime,adherence: freezed == adherence ? _self.adherence : adherence // ignore: cast_nullable_to_non_nullable
as AdherenceLevel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dataVersion: null == dataVersion ? _self.dataVersion : dataVersion // ignore: cast_nullable_to_non_nullable
as int,lastEntryUpdatedAt: freezed == lastEntryUpdatedAt ? _self.lastEntryUpdatedAt : lastEntryUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,needsAiRefresh: null == needsAiRefresh ? _self.needsAiRefresh : needsAiRefresh // ignore: cast_nullable_to_non_nullable
as bool,latestAiSummary: freezed == latestAiSummary ? _self.latestAiSummary : latestAiSummary // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealDayEntity].
extension MealDayEntityPatterns on MealDayEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealDayEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealDayEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealDayEntity value)  $default,){
final _that = this;
switch (_that) {
case _MealDayEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealDayEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MealDayEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime mealDate,  AdherenceLevel? adherence,  DateTime createdAt,  DateTime updatedAt,  int dataVersion,  DateTime? lastEntryUpdatedAt,  bool needsAiRefresh,  String? latestAiSummary,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealDayEntity() when $default != null:
return $default(_that.id,_that.userId,_that.mealDate,_that.adherence,_that.createdAt,_that.updatedAt,_that.dataVersion,_that.lastEntryUpdatedAt,_that.needsAiRefresh,_that.latestAiSummary,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime mealDate,  AdherenceLevel? adherence,  DateTime createdAt,  DateTime updatedAt,  int dataVersion,  DateTime? lastEntryUpdatedAt,  bool needsAiRefresh,  String? latestAiSummary,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _MealDayEntity():
return $default(_that.id,_that.userId,_that.mealDate,_that.adherence,_that.createdAt,_that.updatedAt,_that.dataVersion,_that.lastEntryUpdatedAt,_that.needsAiRefresh,_that.latestAiSummary,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DateTime mealDate,  AdherenceLevel? adherence,  DateTime createdAt,  DateTime updatedAt,  int dataVersion,  DateTime? lastEntryUpdatedAt,  bool needsAiRefresh,  String? latestAiSummary,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _MealDayEntity() when $default != null:
return $default(_that.id,_that.userId,_that.mealDate,_that.adherence,_that.createdAt,_that.updatedAt,_that.dataVersion,_that.lastEntryUpdatedAt,_that.needsAiRefresh,_that.latestAiSummary,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _MealDayEntity implements MealDayEntity {
  const _MealDayEntity({required this.id, required this.userId, required this.mealDate, this.adherence, required this.createdAt, required this.updatedAt, required this.dataVersion, this.lastEntryUpdatedAt, required this.needsAiRefresh, this.latestAiSummary, this.deletedAt});
  

@override final  String id;
// id
@override final  String userId;
// 사용자 id
@override final  DateTime mealDate;
// 날짜  
@override final  AdherenceLevel? adherence;
// 성취도 자가평가
@override final  DateTime createdAt;
// 생성한 날짜
@override final  DateTime updatedAt;
// 수정한 날짜
@override final  int dataVersion;
// 버전 (서버의 트리거를 통해 생성/수정시 증가)
@override final  DateTime? lastEntryUpdatedAt;
// 마지막으로 식단 업데이트한 날짜 (식단만 다룸)
@override final  bool needsAiRefresh;
// AI 분석 버튼 활성화 필요
@override final  String? latestAiSummary;
// 가장 최근 AI 분석 내용 요약
@override final  DateTime? deletedAt;

/// Create a copy of MealDayEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealDayEntityCopyWith<_MealDayEntity> get copyWith => __$MealDayEntityCopyWithImpl<_MealDayEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealDayEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mealDate, mealDate) || other.mealDate == mealDate)&&(identical(other.adherence, adherence) || other.adherence == adherence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dataVersion, dataVersion) || other.dataVersion == dataVersion)&&(identical(other.lastEntryUpdatedAt, lastEntryUpdatedAt) || other.lastEntryUpdatedAt == lastEntryUpdatedAt)&&(identical(other.needsAiRefresh, needsAiRefresh) || other.needsAiRefresh == needsAiRefresh)&&(identical(other.latestAiSummary, latestAiSummary) || other.latestAiSummary == latestAiSummary)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,mealDate,adherence,createdAt,updatedAt,dataVersion,lastEntryUpdatedAt,needsAiRefresh,latestAiSummary,deletedAt);

@override
String toString() {
  return 'MealDayEntity(id: $id, userId: $userId, mealDate: $mealDate, adherence: $adherence, createdAt: $createdAt, updatedAt: $updatedAt, dataVersion: $dataVersion, lastEntryUpdatedAt: $lastEntryUpdatedAt, needsAiRefresh: $needsAiRefresh, latestAiSummary: $latestAiSummary, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MealDayEntityCopyWith<$Res> implements $MealDayEntityCopyWith<$Res> {
  factory _$MealDayEntityCopyWith(_MealDayEntity value, $Res Function(_MealDayEntity) _then) = __$MealDayEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime mealDate, AdherenceLevel? adherence, DateTime createdAt, DateTime updatedAt, int dataVersion, DateTime? lastEntryUpdatedAt, bool needsAiRefresh, String? latestAiSummary, DateTime? deletedAt
});




}
/// @nodoc
class __$MealDayEntityCopyWithImpl<$Res>
    implements _$MealDayEntityCopyWith<$Res> {
  __$MealDayEntityCopyWithImpl(this._self, this._then);

  final _MealDayEntity _self;
  final $Res Function(_MealDayEntity) _then;

/// Create a copy of MealDayEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? mealDate = null,Object? adherence = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dataVersion = null,Object? lastEntryUpdatedAt = freezed,Object? needsAiRefresh = null,Object? latestAiSummary = freezed,Object? deletedAt = freezed,}) {
  return _then(_MealDayEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,mealDate: null == mealDate ? _self.mealDate : mealDate // ignore: cast_nullable_to_non_nullable
as DateTime,adherence: freezed == adherence ? _self.adherence : adherence // ignore: cast_nullable_to_non_nullable
as AdherenceLevel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dataVersion: null == dataVersion ? _self.dataVersion : dataVersion // ignore: cast_nullable_to_non_nullable
as int,lastEntryUpdatedAt: freezed == lastEntryUpdatedAt ? _self.lastEntryUpdatedAt : lastEntryUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,needsAiRefresh: null == needsAiRefresh ? _self.needsAiRefresh : needsAiRefresh // ignore: cast_nullable_to_non_nullable
as bool,latestAiSummary: freezed == latestAiSummary ? _self.latestAiSummary : latestAiSummary // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
