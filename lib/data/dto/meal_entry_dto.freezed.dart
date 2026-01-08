// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealEntryDto {

 String get id;// id
@JsonKey(name: 'meal_day_id') String get mealDayId;// MealDay id (MealEntry이 속해있는 테이블)
 String get category;// 식단 카테고리 (아침,점심,저녁,간식)
 String? get content;// 기록 내용
@JsonKey(name: 'photo_url') String? get photoUrl;// 이미지 url
@JsonKey(name: 'eaten_at') String? get eatenAt;// 먹은 시간 (사용자가 설정)
@JsonKey(name: 'created_at') String get createdAt;// 생성한 날짜
@JsonKey(name: 'updated_at') String get updatedAt;// 수정한 날짜
@JsonKey(name: 'deleted_at') String? get deletedAt;
/// Create a copy of MealEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealEntryDtoCopyWith<MealEntryDto> get copyWith => _$MealEntryDtoCopyWithImpl<MealEntryDto>(this as MealEntryDto, _$identity);

  /// Serializes this MealEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.category, category) || other.category == category)&&(identical(other.content, content) || other.content == content)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,category,content,photoUrl,eatenAt,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'MealEntryDto(id: $id, mealDayId: $mealDayId, category: $category, content: $content, photoUrl: $photoUrl, eatenAt: $eatenAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MealEntryDtoCopyWith<$Res>  {
  factory $MealEntryDtoCopyWith(MealEntryDto value, $Res Function(MealEntryDto) _then) = _$MealEntryDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'meal_day_id') String mealDayId, String category, String? content,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'eaten_at') String? eatenAt,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class _$MealEntryDtoCopyWithImpl<$Res>
    implements $MealEntryDtoCopyWith<$Res> {
  _$MealEntryDtoCopyWithImpl(this._self, this._then);

  final MealEntryDto _self;
  final $Res Function(MealEntryDto) _then;

/// Create a copy of MealEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mealDayId = null,Object? category = null,Object? content = freezed,Object? photoUrl = freezed,Object? eatenAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealEntryDto].
extension MealEntryDtoPatterns on MealEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _MealEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _MealEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'meal_day_id')  String mealDayId,  String category,  String? content, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'eaten_at')  String? eatenAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealEntryDto() when $default != null:
return $default(_that.id,_that.mealDayId,_that.category,_that.content,_that.photoUrl,_that.eatenAt,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'meal_day_id')  String mealDayId,  String category,  String? content, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'eaten_at')  String? eatenAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'deleted_at')  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _MealEntryDto():
return $default(_that.id,_that.mealDayId,_that.category,_that.content,_that.photoUrl,_that.eatenAt,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'meal_day_id')  String mealDayId,  String category,  String? content, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'eaten_at')  String? eatenAt, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _MealEntryDto() when $default != null:
return $default(_that.id,_that.mealDayId,_that.category,_that.content,_that.photoUrl,_that.eatenAt,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealEntryDto implements MealEntryDto {
  const _MealEntryDto({required this.id, @JsonKey(name: 'meal_day_id') required this.mealDayId, required this.category, this.content, @JsonKey(name: 'photo_url') this.photoUrl, @JsonKey(name: 'eaten_at') this.eatenAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _MealEntryDto.fromJson(Map<String, dynamic> json) => _$MealEntryDtoFromJson(json);

@override final  String id;
// id
@override@JsonKey(name: 'meal_day_id') final  String mealDayId;
// MealDay id (MealEntry이 속해있는 테이블)
@override final  String category;
// 식단 카테고리 (아침,점심,저녁,간식)
@override final  String? content;
// 기록 내용
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
// 이미지 url
@override@JsonKey(name: 'eaten_at') final  String? eatenAt;
// 먹은 시간 (사용자가 설정)
@override@JsonKey(name: 'created_at') final  String createdAt;
// 생성한 날짜
@override@JsonKey(name: 'updated_at') final  String updatedAt;
// 수정한 날짜
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;

/// Create a copy of MealEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealEntryDtoCopyWith<_MealEntryDto> get copyWith => __$MealEntryDtoCopyWithImpl<_MealEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.category, category) || other.category == category)&&(identical(other.content, content) || other.content == content)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,category,content,photoUrl,eatenAt,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'MealEntryDto(id: $id, mealDayId: $mealDayId, category: $category, content: $content, photoUrl: $photoUrl, eatenAt: $eatenAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MealEntryDtoCopyWith<$Res> implements $MealEntryDtoCopyWith<$Res> {
  factory _$MealEntryDtoCopyWith(_MealEntryDto value, $Res Function(_MealEntryDto) _then) = __$MealEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'meal_day_id') String mealDayId, String category, String? content,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'eaten_at') String? eatenAt,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class __$MealEntryDtoCopyWithImpl<$Res>
    implements _$MealEntryDtoCopyWith<$Res> {
  __$MealEntryDtoCopyWithImpl(this._self, this._then);

  final _MealEntryDto _self;
  final $Res Function(_MealEntryDto) _then;

/// Create a copy of MealEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mealDayId = null,Object? category = null,Object? content = freezed,Object? photoUrl = freezed,Object? eatenAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_MealEntryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
