// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_analysis_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealAnalysisEntity {

 String get id;// 분석 결과 ID
 String get mealDayId;// MealDay ID
 String get overallSummary;// 분석 요약
 List<ConditionFeedback> get conditionFeedback;// 기저질환별 피드백
 NutritionFeedback get nutritionFeedback;// 영양 피드백
 List<String> get uncertainties;// 불확실한 부분
 String get disclaimer;// 면책 조항
 DateTime get createdAt;
/// Create a copy of MealAnalysisEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealAnalysisEntityCopyWith<MealAnalysisEntity> get copyWith => _$MealAnalysisEntityCopyWithImpl<MealAnalysisEntity>(this as MealAnalysisEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealAnalysisEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.overallSummary, overallSummary) || other.overallSummary == overallSummary)&&const DeepCollectionEquality().equals(other.conditionFeedback, conditionFeedback)&&(identical(other.nutritionFeedback, nutritionFeedback) || other.nutritionFeedback == nutritionFeedback)&&const DeepCollectionEquality().equals(other.uncertainties, uncertainties)&&(identical(other.disclaimer, disclaimer) || other.disclaimer == disclaimer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,overallSummary,const DeepCollectionEquality().hash(conditionFeedback),nutritionFeedback,const DeepCollectionEquality().hash(uncertainties),disclaimer,createdAt);

@override
String toString() {
  return 'MealAnalysisEntity(id: $id, mealDayId: $mealDayId, overallSummary: $overallSummary, conditionFeedback: $conditionFeedback, nutritionFeedback: $nutritionFeedback, uncertainties: $uncertainties, disclaimer: $disclaimer, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MealAnalysisEntityCopyWith<$Res>  {
  factory $MealAnalysisEntityCopyWith(MealAnalysisEntity value, $Res Function(MealAnalysisEntity) _then) = _$MealAnalysisEntityCopyWithImpl;
@useResult
$Res call({
 String id, String mealDayId, String overallSummary, List<ConditionFeedback> conditionFeedback, NutritionFeedback nutritionFeedback, List<String> uncertainties, String disclaimer, DateTime createdAt
});


$NutritionFeedbackCopyWith<$Res> get nutritionFeedback;

}
/// @nodoc
class _$MealAnalysisEntityCopyWithImpl<$Res>
    implements $MealAnalysisEntityCopyWith<$Res> {
  _$MealAnalysisEntityCopyWithImpl(this._self, this._then);

  final MealAnalysisEntity _self;
  final $Res Function(MealAnalysisEntity) _then;

/// Create a copy of MealAnalysisEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mealDayId = null,Object? overallSummary = null,Object? conditionFeedback = null,Object? nutritionFeedback = null,Object? uncertainties = null,Object? disclaimer = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,overallSummary: null == overallSummary ? _self.overallSummary : overallSummary // ignore: cast_nullable_to_non_nullable
as String,conditionFeedback: null == conditionFeedback ? _self.conditionFeedback : conditionFeedback // ignore: cast_nullable_to_non_nullable
as List<ConditionFeedback>,nutritionFeedback: null == nutritionFeedback ? _self.nutritionFeedback : nutritionFeedback // ignore: cast_nullable_to_non_nullable
as NutritionFeedback,uncertainties: null == uncertainties ? _self.uncertainties : uncertainties // ignore: cast_nullable_to_non_nullable
as List<String>,disclaimer: null == disclaimer ? _self.disclaimer : disclaimer // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of MealAnalysisEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionFeedbackCopyWith<$Res> get nutritionFeedback {
  
  return $NutritionFeedbackCopyWith<$Res>(_self.nutritionFeedback, (value) {
    return _then(_self.copyWith(nutritionFeedback: value));
  });
}
}


/// Adds pattern-matching-related methods to [MealAnalysisEntity].
extension MealAnalysisEntityPatterns on MealAnalysisEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealAnalysisEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealAnalysisEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealAnalysisEntity value)  $default,){
final _that = this;
switch (_that) {
case _MealAnalysisEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealAnalysisEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MealAnalysisEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String mealDayId,  String overallSummary,  List<ConditionFeedback> conditionFeedback,  NutritionFeedback nutritionFeedback,  List<String> uncertainties,  String disclaimer,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealAnalysisEntity() when $default != null:
return $default(_that.id,_that.mealDayId,_that.overallSummary,_that.conditionFeedback,_that.nutritionFeedback,_that.uncertainties,_that.disclaimer,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String mealDayId,  String overallSummary,  List<ConditionFeedback> conditionFeedback,  NutritionFeedback nutritionFeedback,  List<String> uncertainties,  String disclaimer,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MealAnalysisEntity():
return $default(_that.id,_that.mealDayId,_that.overallSummary,_that.conditionFeedback,_that.nutritionFeedback,_that.uncertainties,_that.disclaimer,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String mealDayId,  String overallSummary,  List<ConditionFeedback> conditionFeedback,  NutritionFeedback nutritionFeedback,  List<String> uncertainties,  String disclaimer,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MealAnalysisEntity() when $default != null:
return $default(_that.id,_that.mealDayId,_that.overallSummary,_that.conditionFeedback,_that.nutritionFeedback,_that.uncertainties,_that.disclaimer,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _MealAnalysisEntity implements MealAnalysisEntity {
  const _MealAnalysisEntity({required this.id, required this.mealDayId, required this.overallSummary, required final  List<ConditionFeedback> conditionFeedback, required this.nutritionFeedback, required final  List<String> uncertainties, required this.disclaimer, required this.createdAt}): _conditionFeedback = conditionFeedback,_uncertainties = uncertainties;
  

@override final  String id;
// 분석 결과 ID
@override final  String mealDayId;
// MealDay ID
@override final  String overallSummary;
// 분석 요약
 final  List<ConditionFeedback> _conditionFeedback;
// 분석 요약
@override List<ConditionFeedback> get conditionFeedback {
  if (_conditionFeedback is EqualUnmodifiableListView) return _conditionFeedback;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conditionFeedback);
}

// 기저질환별 피드백
@override final  NutritionFeedback nutritionFeedback;
// 영양 피드백
 final  List<String> _uncertainties;
// 영양 피드백
@override List<String> get uncertainties {
  if (_uncertainties is EqualUnmodifiableListView) return _uncertainties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uncertainties);
}

// 불확실한 부분
@override final  String disclaimer;
// 면책 조항
@override final  DateTime createdAt;

/// Create a copy of MealAnalysisEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealAnalysisEntityCopyWith<_MealAnalysisEntity> get copyWith => __$MealAnalysisEntityCopyWithImpl<_MealAnalysisEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealAnalysisEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.overallSummary, overallSummary) || other.overallSummary == overallSummary)&&const DeepCollectionEquality().equals(other._conditionFeedback, _conditionFeedback)&&(identical(other.nutritionFeedback, nutritionFeedback) || other.nutritionFeedback == nutritionFeedback)&&const DeepCollectionEquality().equals(other._uncertainties, _uncertainties)&&(identical(other.disclaimer, disclaimer) || other.disclaimer == disclaimer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,overallSummary,const DeepCollectionEquality().hash(_conditionFeedback),nutritionFeedback,const DeepCollectionEquality().hash(_uncertainties),disclaimer,createdAt);

@override
String toString() {
  return 'MealAnalysisEntity(id: $id, mealDayId: $mealDayId, overallSummary: $overallSummary, conditionFeedback: $conditionFeedback, nutritionFeedback: $nutritionFeedback, uncertainties: $uncertainties, disclaimer: $disclaimer, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MealAnalysisEntityCopyWith<$Res> implements $MealAnalysisEntityCopyWith<$Res> {
  factory _$MealAnalysisEntityCopyWith(_MealAnalysisEntity value, $Res Function(_MealAnalysisEntity) _then) = __$MealAnalysisEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String mealDayId, String overallSummary, List<ConditionFeedback> conditionFeedback, NutritionFeedback nutritionFeedback, List<String> uncertainties, String disclaimer, DateTime createdAt
});


@override $NutritionFeedbackCopyWith<$Res> get nutritionFeedback;

}
/// @nodoc
class __$MealAnalysisEntityCopyWithImpl<$Res>
    implements _$MealAnalysisEntityCopyWith<$Res> {
  __$MealAnalysisEntityCopyWithImpl(this._self, this._then);

  final _MealAnalysisEntity _self;
  final $Res Function(_MealAnalysisEntity) _then;

/// Create a copy of MealAnalysisEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mealDayId = null,Object? overallSummary = null,Object? conditionFeedback = null,Object? nutritionFeedback = null,Object? uncertainties = null,Object? disclaimer = null,Object? createdAt = null,}) {
  return _then(_MealAnalysisEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,overallSummary: null == overallSummary ? _self.overallSummary : overallSummary // ignore: cast_nullable_to_non_nullable
as String,conditionFeedback: null == conditionFeedback ? _self._conditionFeedback : conditionFeedback // ignore: cast_nullable_to_non_nullable
as List<ConditionFeedback>,nutritionFeedback: null == nutritionFeedback ? _self.nutritionFeedback : nutritionFeedback // ignore: cast_nullable_to_non_nullable
as NutritionFeedback,uncertainties: null == uncertainties ? _self._uncertainties : uncertainties // ignore: cast_nullable_to_non_nullable
as List<String>,disclaimer: null == disclaimer ? _self.disclaimer : disclaimer // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MealAnalysisEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionFeedbackCopyWith<$Res> get nutritionFeedback {
  
  return $NutritionFeedbackCopyWith<$Res>(_self.nutritionFeedback, (value) {
    return _then(_self.copyWith(nutritionFeedback: value));
  });
}
}

/// @nodoc
mixin _$ConditionFeedback {

 String get condition;// 기저질환 명
 String get summary;// 해당 질환 관련 패드백 요약
 List<String> get points;// 포인트 내용들
 List<Suggestion> get suggestions;// 개선 제안 리스트
 double get confidence;
/// Create a copy of ConditionFeedback
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConditionFeedbackCopyWith<ConditionFeedback> get copyWith => _$ConditionFeedbackCopyWithImpl<ConditionFeedback>(this as ConditionFeedback, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConditionFeedback&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.points, points)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}


@override
int get hashCode => Object.hash(runtimeType,condition,summary,const DeepCollectionEquality().hash(points),const DeepCollectionEquality().hash(suggestions),confidence);

@override
String toString() {
  return 'ConditionFeedback(condition: $condition, summary: $summary, points: $points, suggestions: $suggestions, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class $ConditionFeedbackCopyWith<$Res>  {
  factory $ConditionFeedbackCopyWith(ConditionFeedback value, $Res Function(ConditionFeedback) _then) = _$ConditionFeedbackCopyWithImpl;
@useResult
$Res call({
 String condition, String summary, List<String> points, List<Suggestion> suggestions, double confidence
});




}
/// @nodoc
class _$ConditionFeedbackCopyWithImpl<$Res>
    implements $ConditionFeedbackCopyWith<$Res> {
  _$ConditionFeedbackCopyWithImpl(this._self, this._then);

  final ConditionFeedback _self;
  final $Res Function(ConditionFeedback) _then;

/// Create a copy of ConditionFeedback
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? condition = null,Object? summary = null,Object? points = null,Object? suggestions = null,Object? confidence = null,}) {
  return _then(_self.copyWith(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<String>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Suggestion>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ConditionFeedback].
extension ConditionFeedbackPatterns on ConditionFeedback {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConditionFeedback value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConditionFeedback() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConditionFeedback value)  $default,){
final _that = this;
switch (_that) {
case _ConditionFeedback():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConditionFeedback value)?  $default,){
final _that = this;
switch (_that) {
case _ConditionFeedback() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String condition,  String summary,  List<String> points,  List<Suggestion> suggestions,  double confidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConditionFeedback() when $default != null:
return $default(_that.condition,_that.summary,_that.points,_that.suggestions,_that.confidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String condition,  String summary,  List<String> points,  List<Suggestion> suggestions,  double confidence)  $default,) {final _that = this;
switch (_that) {
case _ConditionFeedback():
return $default(_that.condition,_that.summary,_that.points,_that.suggestions,_that.confidence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String condition,  String summary,  List<String> points,  List<Suggestion> suggestions,  double confidence)?  $default,) {final _that = this;
switch (_that) {
case _ConditionFeedback() when $default != null:
return $default(_that.condition,_that.summary,_that.points,_that.suggestions,_that.confidence);case _:
  return null;

}
}

}

/// @nodoc


class _ConditionFeedback implements ConditionFeedback {
  const _ConditionFeedback({required this.condition, required this.summary, required final  List<String> points, required final  List<Suggestion> suggestions, required this.confidence}): _points = points,_suggestions = suggestions;
  

@override final  String condition;
// 기저질환 명
@override final  String summary;
// 해당 질환 관련 패드백 요약
 final  List<String> _points;
// 해당 질환 관련 패드백 요약
@override List<String> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

// 포인트 내용들
 final  List<Suggestion> _suggestions;
// 포인트 내용들
@override List<Suggestion> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

// 개선 제안 리스트
@override final  double confidence;

/// Create a copy of ConditionFeedback
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConditionFeedbackCopyWith<_ConditionFeedback> get copyWith => __$ConditionFeedbackCopyWithImpl<_ConditionFeedback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConditionFeedback&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._points, _points)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}


@override
int get hashCode => Object.hash(runtimeType,condition,summary,const DeepCollectionEquality().hash(_points),const DeepCollectionEquality().hash(_suggestions),confidence);

@override
String toString() {
  return 'ConditionFeedback(condition: $condition, summary: $summary, points: $points, suggestions: $suggestions, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class _$ConditionFeedbackCopyWith<$Res> implements $ConditionFeedbackCopyWith<$Res> {
  factory _$ConditionFeedbackCopyWith(_ConditionFeedback value, $Res Function(_ConditionFeedback) _then) = __$ConditionFeedbackCopyWithImpl;
@override @useResult
$Res call({
 String condition, String summary, List<String> points, List<Suggestion> suggestions, double confidence
});




}
/// @nodoc
class __$ConditionFeedbackCopyWithImpl<$Res>
    implements _$ConditionFeedbackCopyWith<$Res> {
  __$ConditionFeedbackCopyWithImpl(this._self, this._then);

  final _ConditionFeedback _self;
  final $Res Function(_ConditionFeedback) _then;

/// Create a copy of ConditionFeedback
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? condition = null,Object? summary = null,Object? points = null,Object? suggestions = null,Object? confidence = null,}) {
  return _then(_ConditionFeedback(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<String>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Suggestion>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$Suggestion {

 String get title;// 제안 제목
 String get detail;
/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionCopyWith<Suggestion> get copyWith => _$SuggestionCopyWithImpl<Suggestion>(this as Suggestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Suggestion&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,title,detail);

@override
String toString() {
  return 'Suggestion(title: $title, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $SuggestionCopyWith<$Res>  {
  factory $SuggestionCopyWith(Suggestion value, $Res Function(Suggestion) _then) = _$SuggestionCopyWithImpl;
@useResult
$Res call({
 String title, String detail
});




}
/// @nodoc
class _$SuggestionCopyWithImpl<$Res>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._self, this._then);

  final Suggestion _self;
  final $Res Function(Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? detail = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Suggestion].
extension SuggestionPatterns on Suggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Suggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Suggestion value)  $default,){
final _that = this;
switch (_that) {
case _Suggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Suggestion value)?  $default,){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that.title,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String detail)  $default,) {final _that = this;
switch (_that) {
case _Suggestion():
return $default(_that.title,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String detail)?  $default,) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that.title,_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class _Suggestion implements Suggestion {
  const _Suggestion({required this.title, required this.detail});
  

@override final  String title;
// 제안 제목
@override final  String detail;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionCopyWith<_Suggestion> get copyWith => __$SuggestionCopyWithImpl<_Suggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Suggestion&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,title,detail);

@override
String toString() {
  return 'Suggestion(title: $title, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$SuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$SuggestionCopyWith(_Suggestion value, $Res Function(_Suggestion) _then) = __$SuggestionCopyWithImpl;
@override @useResult
$Res call({
 String title, String detail
});




}
/// @nodoc
class __$SuggestionCopyWithImpl<$Res>
    implements _$SuggestionCopyWith<$Res> {
  __$SuggestionCopyWithImpl(this._self, this._then);

  final _Suggestion _self;
  final $Res Function(_Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? detail = null,}) {
  return _then(_Suggestion(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$NutritionFeedback {

 String get summary;// 영양 요약
 List<String> get goodPoints;// 잘한 점
 List<String> get improvePoints;// 개선할 점
 List<NextAction> get nextActions;// 다음으로 해야할거
 double get confidence;
/// Create a copy of NutritionFeedback
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFeedbackCopyWith<NutritionFeedback> get copyWith => _$NutritionFeedbackCopyWithImpl<NutritionFeedback>(this as NutritionFeedback, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFeedback&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.goodPoints, goodPoints)&&const DeepCollectionEquality().equals(other.improvePoints, improvePoints)&&const DeepCollectionEquality().equals(other.nextActions, nextActions)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(goodPoints),const DeepCollectionEquality().hash(improvePoints),const DeepCollectionEquality().hash(nextActions),confidence);

@override
String toString() {
  return 'NutritionFeedback(summary: $summary, goodPoints: $goodPoints, improvePoints: $improvePoints, nextActions: $nextActions, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class $NutritionFeedbackCopyWith<$Res>  {
  factory $NutritionFeedbackCopyWith(NutritionFeedback value, $Res Function(NutritionFeedback) _then) = _$NutritionFeedbackCopyWithImpl;
@useResult
$Res call({
 String summary, List<String> goodPoints, List<String> improvePoints, List<NextAction> nextActions, double confidence
});




}
/// @nodoc
class _$NutritionFeedbackCopyWithImpl<$Res>
    implements $NutritionFeedbackCopyWith<$Res> {
  _$NutritionFeedbackCopyWithImpl(this._self, this._then);

  final NutritionFeedback _self;
  final $Res Function(NutritionFeedback) _then;

/// Create a copy of NutritionFeedback
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? goodPoints = null,Object? improvePoints = null,Object? nextActions = null,Object? confidence = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,goodPoints: null == goodPoints ? _self.goodPoints : goodPoints // ignore: cast_nullable_to_non_nullable
as List<String>,improvePoints: null == improvePoints ? _self.improvePoints : improvePoints // ignore: cast_nullable_to_non_nullable
as List<String>,nextActions: null == nextActions ? _self.nextActions : nextActions // ignore: cast_nullable_to_non_nullable
as List<NextAction>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionFeedback].
extension NutritionFeedbackPatterns on NutritionFeedback {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionFeedback value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFeedback() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionFeedback value)  $default,){
final _that = this;
switch (_that) {
case _NutritionFeedback():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionFeedback value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionFeedback() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String summary,  List<String> goodPoints,  List<String> improvePoints,  List<NextAction> nextActions,  double confidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFeedback() when $default != null:
return $default(_that.summary,_that.goodPoints,_that.improvePoints,_that.nextActions,_that.confidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String summary,  List<String> goodPoints,  List<String> improvePoints,  List<NextAction> nextActions,  double confidence)  $default,) {final _that = this;
switch (_that) {
case _NutritionFeedback():
return $default(_that.summary,_that.goodPoints,_that.improvePoints,_that.nextActions,_that.confidence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String summary,  List<String> goodPoints,  List<String> improvePoints,  List<NextAction> nextActions,  double confidence)?  $default,) {final _that = this;
switch (_that) {
case _NutritionFeedback() when $default != null:
return $default(_that.summary,_that.goodPoints,_that.improvePoints,_that.nextActions,_that.confidence);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionFeedback implements NutritionFeedback {
  const _NutritionFeedback({required this.summary, required final  List<String> goodPoints, required final  List<String> improvePoints, required final  List<NextAction> nextActions, required this.confidence}): _goodPoints = goodPoints,_improvePoints = improvePoints,_nextActions = nextActions;
  

@override final  String summary;
// 영양 요약
 final  List<String> _goodPoints;
// 영양 요약
@override List<String> get goodPoints {
  if (_goodPoints is EqualUnmodifiableListView) return _goodPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goodPoints);
}

// 잘한 점
 final  List<String> _improvePoints;
// 잘한 점
@override List<String> get improvePoints {
  if (_improvePoints is EqualUnmodifiableListView) return _improvePoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_improvePoints);
}

// 개선할 점
 final  List<NextAction> _nextActions;
// 개선할 점
@override List<NextAction> get nextActions {
  if (_nextActions is EqualUnmodifiableListView) return _nextActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nextActions);
}

// 다음으로 해야할거
@override final  double confidence;

/// Create a copy of NutritionFeedback
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFeedbackCopyWith<_NutritionFeedback> get copyWith => __$NutritionFeedbackCopyWithImpl<_NutritionFeedback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFeedback&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._goodPoints, _goodPoints)&&const DeepCollectionEquality().equals(other._improvePoints, _improvePoints)&&const DeepCollectionEquality().equals(other._nextActions, _nextActions)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_goodPoints),const DeepCollectionEquality().hash(_improvePoints),const DeepCollectionEquality().hash(_nextActions),confidence);

@override
String toString() {
  return 'NutritionFeedback(summary: $summary, goodPoints: $goodPoints, improvePoints: $improvePoints, nextActions: $nextActions, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class _$NutritionFeedbackCopyWith<$Res> implements $NutritionFeedbackCopyWith<$Res> {
  factory _$NutritionFeedbackCopyWith(_NutritionFeedback value, $Res Function(_NutritionFeedback) _then) = __$NutritionFeedbackCopyWithImpl;
@override @useResult
$Res call({
 String summary, List<String> goodPoints, List<String> improvePoints, List<NextAction> nextActions, double confidence
});




}
/// @nodoc
class __$NutritionFeedbackCopyWithImpl<$Res>
    implements _$NutritionFeedbackCopyWith<$Res> {
  __$NutritionFeedbackCopyWithImpl(this._self, this._then);

  final _NutritionFeedback _self;
  final $Res Function(_NutritionFeedback) _then;

/// Create a copy of NutritionFeedback
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? goodPoints = null,Object? improvePoints = null,Object? nextActions = null,Object? confidence = null,}) {
  return _then(_NutritionFeedback(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,goodPoints: null == goodPoints ? _self._goodPoints : goodPoints // ignore: cast_nullable_to_non_nullable
as List<String>,improvePoints: null == improvePoints ? _self._improvePoints : improvePoints // ignore: cast_nullable_to_non_nullable
as List<String>,nextActions: null == nextActions ? _self._nextActions : nextActions // ignore: cast_nullable_to_non_nullable
as List<NextAction>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$NextAction {

 String get title;// 제목
 String get detail;
/// Create a copy of NextAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextActionCopyWith<NextAction> get copyWith => _$NextActionCopyWithImpl<NextAction>(this as NextAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextAction&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,title,detail);

@override
String toString() {
  return 'NextAction(title: $title, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $NextActionCopyWith<$Res>  {
  factory $NextActionCopyWith(NextAction value, $Res Function(NextAction) _then) = _$NextActionCopyWithImpl;
@useResult
$Res call({
 String title, String detail
});




}
/// @nodoc
class _$NextActionCopyWithImpl<$Res>
    implements $NextActionCopyWith<$Res> {
  _$NextActionCopyWithImpl(this._self, this._then);

  final NextAction _self;
  final $Res Function(NextAction) _then;

/// Create a copy of NextAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? detail = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NextAction].
extension NextActionPatterns on NextAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NextAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NextAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NextAction value)  $default,){
final _that = this;
switch (_that) {
case _NextAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NextAction value)?  $default,){
final _that = this;
switch (_that) {
case _NextAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NextAction() when $default != null:
return $default(_that.title,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String detail)  $default,) {final _that = this;
switch (_that) {
case _NextAction():
return $default(_that.title,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String detail)?  $default,) {final _that = this;
switch (_that) {
case _NextAction() when $default != null:
return $default(_that.title,_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class _NextAction implements NextAction {
  const _NextAction({required this.title, required this.detail});
  

@override final  String title;
// 제목
@override final  String detail;

/// Create a copy of NextAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextActionCopyWith<_NextAction> get copyWith => __$NextActionCopyWithImpl<_NextAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextAction&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,title,detail);

@override
String toString() {
  return 'NextAction(title: $title, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$NextActionCopyWith<$Res> implements $NextActionCopyWith<$Res> {
  factory _$NextActionCopyWith(_NextAction value, $Res Function(_NextAction) _then) = __$NextActionCopyWithImpl;
@override @useResult
$Res call({
 String title, String detail
});




}
/// @nodoc
class __$NextActionCopyWithImpl<$Res>
    implements _$NextActionCopyWith<$Res> {
  __$NextActionCopyWithImpl(this._self, this._then);

  final _NextAction _self;
  final $Res Function(_NextAction) _then;

/// Create a copy of NextAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? detail = null,}) {
  return _then(_NextAction(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
