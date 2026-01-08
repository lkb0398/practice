// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_day_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealDayDto {

 String get id;// id
@JsonKey(name: 'user_id') String get userId;// 사용자 id
@JsonKey(name: 'meal_date') String get mealDate;// 날짜
 String? get adherence;// 성취도 자가평가
@JsonKey(name: 'created_at') String get createdAt;// 생성한 날짜
@JsonKey(name: 'updated_at') String get updatedAt;// 수정한 날짜
@JsonKey(name: 'data_version') int get dataVersion;// 버전 (서버의 트리거를 통해 생성/수정시 증가)
@JsonKey(name: 'last_entry_updated_at') String? get lastEntryUpdatedAt;// 마지막으로 식단 업데이트한 날짜 (식단만 다룸)
@JsonKey(name: 'needs_ai_refresh') bool get needsAiRefresh;// AI 분석 버튼 활성화 필요
@JsonKey(name: 'latest_ai_summary') String? get latestAiSummary;// 가장 최근 AI 분석 내용 요약
@JsonKey(name: 'deleted_at') String? get deletedAt;
/// Create a copy of MealDayDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealDayDtoCopyWith<MealDayDto> get copyWith => _$MealDayDtoCopyWithImpl<MealDayDto>(this as MealDayDto, _$identity);

  /// Serializes this MealDayDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealDayDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mealDate, mealDate) || other.mealDate == mealDate)&&(identical(other.adherence, adherence) || other.adherence == adherence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dataVersion, dataVersion) || other.dataVersion == dataVersion)&&(identical(other.lastEntryUpdatedAt, lastEntryUpdatedAt) || other.lastEntryUpdatedAt == lastEntryUpdatedAt)&&(identical(other.needsAiRefresh, needsAiRefresh) || other.needsAiRefresh == needsAiRefresh)&&(identical(other.latestAiSummary, latestAiSummary) || other.latestAiSummary == latestAiSummary)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mealDate,adherence,createdAt,updatedAt,dataVersion,lastEntryUpdatedAt,needsAiRefresh,latestAiSummary,deletedAt);

@override
String toString() {
  return 'MealDayDto(id: $id, userId: $userId, mealDate: $mealDate, adherence: $adherence, createdAt: $createdAt, updatedAt: $updatedAt, dataVersion: $dataVersion, lastEntryUpdatedAt: $lastEntryUpdatedAt, needsAiRefresh: $needsAiRefresh, latestAiSummary: $latestAiSummary, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MealDayDtoCopyWith<$Res>  {
  factory $MealDayDtoCopyWith(MealDayDto value, $Res Function(MealDayDto) _then) = _$MealDayDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'meal_date') String mealDate, String? adherence,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'data_version') int dataVersion,@JsonKey(name: 'last_entry_updated_at') String? lastEntryUpdatedAt,@JsonKey(name: 'needs_ai_refresh') bool needsAiRefresh,@JsonKey(name: 'latest_ai_summary') String? latestAiSummary,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class _$MealDayDtoCopyWithImpl<$Res>
    implements $MealDayDtoCopyWith<$Res> {
  _$MealDayDtoCopyWithImpl(this._self, this._then);

  final MealDayDto _self;
  final $Res Function(MealDayDto) _then;

/// Create a copy of MealDayDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? mealDate = null,Object? adherence = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dataVersion = null,Object? lastEntryUpdatedAt = freezed,Object? needsAiRefresh = null,Object? latestAiSummary = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,mealDate: null == mealDate ? _self.mealDate : mealDate // ignore: cast_nullable_to_non_nullable
as String,adherence: freezed == adherence ? _self.adherence : adherence // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,dataVersion: null == dataVersion ? _self.dataVersion : dataVersion // ignore: cast_nullable_to_non_nullable
as int,lastEntryUpdatedAt: freezed == lastEntryUpdatedAt ? _self.lastEntryUpdatedAt : lastEntryUpdatedAt // ignore: cast_nullable_to_non_nullable
as String?,needsAiRefresh: null == needsAiRefresh ? _self.needsAiRefresh : needsAiRefresh // ignore: cast_nullable_to_non_nullable
as bool,latestAiSummary: freezed == latestAiSummary ? _self.latestAiSummary : latestAiSummary // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealDayDto].
extension MealDayDtoPatterns on MealDayDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealDayDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealDayDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealDayDto value)  $default,){
final _that = this;
switch (_that) {
case _MealDayDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealDayDto value)?  $default,){
final _that = this;
switch (_that) {
case _MealDayDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'meal_date')  String mealDate,  String? adherence, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'data_version')  int dataVersion, @JsonKey(name: 'last_entry_updated_at')  String? lastEntryUpdatedAt, @JsonKey(name: 'needs_ai_refresh')  bool needsAiRefresh, @JsonKey(name: 'latest_ai_summary')  String? latestAiSummary, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealDayDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'meal_date')  String mealDate,  String? adherence, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'data_version')  int dataVersion, @JsonKey(name: 'last_entry_updated_at')  String? lastEntryUpdatedAt, @JsonKey(name: 'needs_ai_refresh')  bool needsAiRefresh, @JsonKey(name: 'latest_ai_summary')  String? latestAiSummary, @JsonKey(name: 'deleted_at')  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _MealDayDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'meal_date')  String mealDate,  String? adherence, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'data_version')  int dataVersion, @JsonKey(name: 'last_entry_updated_at')  String? lastEntryUpdatedAt, @JsonKey(name: 'needs_ai_refresh')  bool needsAiRefresh, @JsonKey(name: 'latest_ai_summary')  String? latestAiSummary, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _MealDayDto() when $default != null:
return $default(_that.id,_that.userId,_that.mealDate,_that.adherence,_that.createdAt,_that.updatedAt,_that.dataVersion,_that.lastEntryUpdatedAt,_that.needsAiRefresh,_that.latestAiSummary,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealDayDto implements MealDayDto {
  const _MealDayDto({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'meal_date') required this.mealDate, this.adherence, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'data_version') required this.dataVersion, @JsonKey(name: 'last_entry_updated_at') this.lastEntryUpdatedAt, @JsonKey(name: 'needs_ai_refresh') required this.needsAiRefresh, @JsonKey(name: 'latest_ai_summary') this.latestAiSummary, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _MealDayDto.fromJson(Map<String, dynamic> json) => _$MealDayDtoFromJson(json);

@override final  String id;
// id
@override@JsonKey(name: 'user_id') final  String userId;
// 사용자 id
@override@JsonKey(name: 'meal_date') final  String mealDate;
// 날짜
@override final  String? adherence;
// 성취도 자가평가
@override@JsonKey(name: 'created_at') final  String createdAt;
// 생성한 날짜
@override@JsonKey(name: 'updated_at') final  String updatedAt;
// 수정한 날짜
@override@JsonKey(name: 'data_version') final  int dataVersion;
// 버전 (서버의 트리거를 통해 생성/수정시 증가)
@override@JsonKey(name: 'last_entry_updated_at') final  String? lastEntryUpdatedAt;
// 마지막으로 식단 업데이트한 날짜 (식단만 다룸)
@override@JsonKey(name: 'needs_ai_refresh') final  bool needsAiRefresh;
// AI 분석 버튼 활성화 필요
@override@JsonKey(name: 'latest_ai_summary') final  String? latestAiSummary;
// 가장 최근 AI 분석 내용 요약
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;

/// Create a copy of MealDayDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealDayDtoCopyWith<_MealDayDto> get copyWith => __$MealDayDtoCopyWithImpl<_MealDayDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealDayDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealDayDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mealDate, mealDate) || other.mealDate == mealDate)&&(identical(other.adherence, adherence) || other.adherence == adherence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dataVersion, dataVersion) || other.dataVersion == dataVersion)&&(identical(other.lastEntryUpdatedAt, lastEntryUpdatedAt) || other.lastEntryUpdatedAt == lastEntryUpdatedAt)&&(identical(other.needsAiRefresh, needsAiRefresh) || other.needsAiRefresh == needsAiRefresh)&&(identical(other.latestAiSummary, latestAiSummary) || other.latestAiSummary == latestAiSummary)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mealDate,adherence,createdAt,updatedAt,dataVersion,lastEntryUpdatedAt,needsAiRefresh,latestAiSummary,deletedAt);

@override
String toString() {
  return 'MealDayDto(id: $id, userId: $userId, mealDate: $mealDate, adherence: $adherence, createdAt: $createdAt, updatedAt: $updatedAt, dataVersion: $dataVersion, lastEntryUpdatedAt: $lastEntryUpdatedAt, needsAiRefresh: $needsAiRefresh, latestAiSummary: $latestAiSummary, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MealDayDtoCopyWith<$Res> implements $MealDayDtoCopyWith<$Res> {
  factory _$MealDayDtoCopyWith(_MealDayDto value, $Res Function(_MealDayDto) _then) = __$MealDayDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'meal_date') String mealDate, String? adherence,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'data_version') int dataVersion,@JsonKey(name: 'last_entry_updated_at') String? lastEntryUpdatedAt,@JsonKey(name: 'needs_ai_refresh') bool needsAiRefresh,@JsonKey(name: 'latest_ai_summary') String? latestAiSummary,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class __$MealDayDtoCopyWithImpl<$Res>
    implements _$MealDayDtoCopyWith<$Res> {
  __$MealDayDtoCopyWithImpl(this._self, this._then);

  final _MealDayDto _self;
  final $Res Function(_MealDayDto) _then;

/// Create a copy of MealDayDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? mealDate = null,Object? adherence = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dataVersion = null,Object? lastEntryUpdatedAt = freezed,Object? needsAiRefresh = null,Object? latestAiSummary = freezed,Object? deletedAt = freezed,}) {
  return _then(_MealDayDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,mealDate: null == mealDate ? _self.mealDate : mealDate // ignore: cast_nullable_to_non_nullable
as String,adherence: freezed == adherence ? _self.adherence : adherence // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,dataVersion: null == dataVersion ? _self.dataVersion : dataVersion // ignore: cast_nullable_to_non_nullable
as int,lastEntryUpdatedAt: freezed == lastEntryUpdatedAt ? _self.lastEntryUpdatedAt : lastEntryUpdatedAt // ignore: cast_nullable_to_non_nullable
as String?,needsAiRefresh: null == needsAiRefresh ? _self.needsAiRefresh : needsAiRefresh // ignore: cast_nullable_to_non_nullable
as bool,latestAiSummary: freezed == latestAiSummary ? _self.latestAiSummary : latestAiSummary // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
