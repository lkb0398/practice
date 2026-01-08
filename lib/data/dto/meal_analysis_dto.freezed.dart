// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_analysis_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealAnalysisDto {

 String get id;// ID
@JsonKey(name: 'meal_day_id') String get mealDayId;// MealDay ID
@JsonKey(name: 'user_id') String get userId;// User ID
@JsonKey(name: 'based_on_version') int get basedOnVersion;// 분석 당시 MealDay 버전
 String? get locale;// 언어
@JsonKey(name: 'overall_summary') String get overallSummary;// 분석 요약
@JsonKey(name: 'condition_feedback') List<Map<String, dynamic>>? get conditionFeedback;// 기저질환별 피드백
 List<Map<String, dynamic>>? get suggestions;// 제안
 Map<String, dynamic> get result;// 전체 AI 응답 JSON
@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of MealAnalysisDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealAnalysisDtoCopyWith<MealAnalysisDto> get copyWith => _$MealAnalysisDtoCopyWithImpl<MealAnalysisDto>(this as MealAnalysisDto, _$identity);

  /// Serializes this MealAnalysisDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealAnalysisDto&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.basedOnVersion, basedOnVersion) || other.basedOnVersion == basedOnVersion)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.overallSummary, overallSummary) || other.overallSummary == overallSummary)&&const DeepCollectionEquality().equals(other.conditionFeedback, conditionFeedback)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&const DeepCollectionEquality().equals(other.result, result)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,userId,basedOnVersion,locale,overallSummary,const DeepCollectionEquality().hash(conditionFeedback),const DeepCollectionEquality().hash(suggestions),const DeepCollectionEquality().hash(result),createdAt);

@override
String toString() {
  return 'MealAnalysisDto(id: $id, mealDayId: $mealDayId, userId: $userId, basedOnVersion: $basedOnVersion, locale: $locale, overallSummary: $overallSummary, conditionFeedback: $conditionFeedback, suggestions: $suggestions, result: $result, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MealAnalysisDtoCopyWith<$Res>  {
  factory $MealAnalysisDtoCopyWith(MealAnalysisDto value, $Res Function(MealAnalysisDto) _then) = _$MealAnalysisDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'meal_day_id') String mealDayId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'based_on_version') int basedOnVersion, String? locale,@JsonKey(name: 'overall_summary') String overallSummary,@JsonKey(name: 'condition_feedback') List<Map<String, dynamic>>? conditionFeedback, List<Map<String, dynamic>>? suggestions, Map<String, dynamic> result,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$MealAnalysisDtoCopyWithImpl<$Res>
    implements $MealAnalysisDtoCopyWith<$Res> {
  _$MealAnalysisDtoCopyWithImpl(this._self, this._then);

  final MealAnalysisDto _self;
  final $Res Function(MealAnalysisDto) _then;

/// Create a copy of MealAnalysisDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mealDayId = null,Object? userId = null,Object? basedOnVersion = null,Object? locale = freezed,Object? overallSummary = null,Object? conditionFeedback = freezed,Object? suggestions = freezed,Object? result = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,basedOnVersion: null == basedOnVersion ? _self.basedOnVersion : basedOnVersion // ignore: cast_nullable_to_non_nullable
as int,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,overallSummary: null == overallSummary ? _self.overallSummary : overallSummary // ignore: cast_nullable_to_non_nullable
as String,conditionFeedback: freezed == conditionFeedback ? _self.conditionFeedback : conditionFeedback // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,suggestions: freezed == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MealAnalysisDto].
extension MealAnalysisDtoPatterns on MealAnalysisDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealAnalysisDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealAnalysisDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealAnalysisDto value)  $default,){
final _that = this;
switch (_that) {
case _MealAnalysisDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealAnalysisDto value)?  $default,){
final _that = this;
switch (_that) {
case _MealAnalysisDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'meal_day_id')  String mealDayId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'based_on_version')  int basedOnVersion,  String? locale, @JsonKey(name: 'overall_summary')  String overallSummary, @JsonKey(name: 'condition_feedback')  List<Map<String, dynamic>>? conditionFeedback,  List<Map<String, dynamic>>? suggestions,  Map<String, dynamic> result, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealAnalysisDto() when $default != null:
return $default(_that.id,_that.mealDayId,_that.userId,_that.basedOnVersion,_that.locale,_that.overallSummary,_that.conditionFeedback,_that.suggestions,_that.result,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'meal_day_id')  String mealDayId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'based_on_version')  int basedOnVersion,  String? locale, @JsonKey(name: 'overall_summary')  String overallSummary, @JsonKey(name: 'condition_feedback')  List<Map<String, dynamic>>? conditionFeedback,  List<Map<String, dynamic>>? suggestions,  Map<String, dynamic> result, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _MealAnalysisDto():
return $default(_that.id,_that.mealDayId,_that.userId,_that.basedOnVersion,_that.locale,_that.overallSummary,_that.conditionFeedback,_that.suggestions,_that.result,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'meal_day_id')  String mealDayId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'based_on_version')  int basedOnVersion,  String? locale, @JsonKey(name: 'overall_summary')  String overallSummary, @JsonKey(name: 'condition_feedback')  List<Map<String, dynamic>>? conditionFeedback,  List<Map<String, dynamic>>? suggestions,  Map<String, dynamic> result, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MealAnalysisDto() when $default != null:
return $default(_that.id,_that.mealDayId,_that.userId,_that.basedOnVersion,_that.locale,_that.overallSummary,_that.conditionFeedback,_that.suggestions,_that.result,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealAnalysisDto implements MealAnalysisDto {
  const _MealAnalysisDto({required this.id, @JsonKey(name: 'meal_day_id') required this.mealDayId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'based_on_version') required this.basedOnVersion, this.locale, @JsonKey(name: 'overall_summary') required this.overallSummary, @JsonKey(name: 'condition_feedback') final  List<Map<String, dynamic>>? conditionFeedback, final  List<Map<String, dynamic>>? suggestions, required final  Map<String, dynamic> result, @JsonKey(name: 'created_at') required this.createdAt}): _conditionFeedback = conditionFeedback,_suggestions = suggestions,_result = result;
  factory _MealAnalysisDto.fromJson(Map<String, dynamic> json) => _$MealAnalysisDtoFromJson(json);

@override final  String id;
// ID
@override@JsonKey(name: 'meal_day_id') final  String mealDayId;
// MealDay ID
@override@JsonKey(name: 'user_id') final  String userId;
// User ID
@override@JsonKey(name: 'based_on_version') final  int basedOnVersion;
// 분석 당시 MealDay 버전
@override final  String? locale;
// 언어
@override@JsonKey(name: 'overall_summary') final  String overallSummary;
// 분석 요약
 final  List<Map<String, dynamic>>? _conditionFeedback;
// 분석 요약
@override@JsonKey(name: 'condition_feedback') List<Map<String, dynamic>>? get conditionFeedback {
  final value = _conditionFeedback;
  if (value == null) return null;
  if (_conditionFeedback is EqualUnmodifiableListView) return _conditionFeedback;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// 기저질환별 피드백
 final  List<Map<String, dynamic>>? _suggestions;
// 기저질환별 피드백
@override List<Map<String, dynamic>>? get suggestions {
  final value = _suggestions;
  if (value == null) return null;
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// 제안
 final  Map<String, dynamic> _result;
// 제안
@override Map<String, dynamic> get result {
  if (_result is EqualUnmodifiableMapView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_result);
}

// 전체 AI 응답 JSON
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of MealAnalysisDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealAnalysisDtoCopyWith<_MealAnalysisDto> get copyWith => __$MealAnalysisDtoCopyWithImpl<_MealAnalysisDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealAnalysisDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealAnalysisDto&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.basedOnVersion, basedOnVersion) || other.basedOnVersion == basedOnVersion)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.overallSummary, overallSummary) || other.overallSummary == overallSummary)&&const DeepCollectionEquality().equals(other._conditionFeedback, _conditionFeedback)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&const DeepCollectionEquality().equals(other._result, _result)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,userId,basedOnVersion,locale,overallSummary,const DeepCollectionEquality().hash(_conditionFeedback),const DeepCollectionEquality().hash(_suggestions),const DeepCollectionEquality().hash(_result),createdAt);

@override
String toString() {
  return 'MealAnalysisDto(id: $id, mealDayId: $mealDayId, userId: $userId, basedOnVersion: $basedOnVersion, locale: $locale, overallSummary: $overallSummary, conditionFeedback: $conditionFeedback, suggestions: $suggestions, result: $result, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MealAnalysisDtoCopyWith<$Res> implements $MealAnalysisDtoCopyWith<$Res> {
  factory _$MealAnalysisDtoCopyWith(_MealAnalysisDto value, $Res Function(_MealAnalysisDto) _then) = __$MealAnalysisDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'meal_day_id') String mealDayId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'based_on_version') int basedOnVersion, String? locale,@JsonKey(name: 'overall_summary') String overallSummary,@JsonKey(name: 'condition_feedback') List<Map<String, dynamic>>? conditionFeedback, List<Map<String, dynamic>>? suggestions, Map<String, dynamic> result,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$MealAnalysisDtoCopyWithImpl<$Res>
    implements _$MealAnalysisDtoCopyWith<$Res> {
  __$MealAnalysisDtoCopyWithImpl(this._self, this._then);

  final _MealAnalysisDto _self;
  final $Res Function(_MealAnalysisDto) _then;

/// Create a copy of MealAnalysisDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mealDayId = null,Object? userId = null,Object? basedOnVersion = null,Object? locale = freezed,Object? overallSummary = null,Object? conditionFeedback = freezed,Object? suggestions = freezed,Object? result = null,Object? createdAt = null,}) {
  return _then(_MealAnalysisDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,basedOnVersion: null == basedOnVersion ? _self.basedOnVersion : basedOnVersion // ignore: cast_nullable_to_non_nullable
as int,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,overallSummary: null == overallSummary ? _self.overallSummary : overallSummary // ignore: cast_nullable_to_non_nullable
as String,conditionFeedback: freezed == conditionFeedback ? _self._conditionFeedback : conditionFeedback // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,suggestions: freezed == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
