// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entry_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealEntryEntity {

 String get id;// id
 String get mealDayId;// MealDay id (MealEntry이 속해있는 테이블)
 MealCategory get category;// 식단 카테고리 (아침,점심,저녁,간식)
 String? get content;// 기록 내용
 String? get photoUrl;// 이미지 url
 DateTime? get eatenAt;// 먹은 시간 (사용자가 설정)
 DateTime get createdAt;// 생성한 날짜
 DateTime get updatedAt;// 수정한 날짜
 DateTime? get deletedAt;
/// Create a copy of MealEntryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealEntryEntityCopyWith<MealEntryEntity> get copyWith => _$MealEntryEntityCopyWithImpl<MealEntryEntity>(this as MealEntryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealEntryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.category, category) || other.category == category)&&(identical(other.content, content) || other.content == content)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,category,content,photoUrl,eatenAt,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'MealEntryEntity(id: $id, mealDayId: $mealDayId, category: $category, content: $content, photoUrl: $photoUrl, eatenAt: $eatenAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MealEntryEntityCopyWith<$Res>  {
  factory $MealEntryEntityCopyWith(MealEntryEntity value, $Res Function(MealEntryEntity) _then) = _$MealEntryEntityCopyWithImpl;
@useResult
$Res call({
 String id, String mealDayId, MealCategory category, String? content, String? photoUrl, DateTime? eatenAt, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class _$MealEntryEntityCopyWithImpl<$Res>
    implements $MealEntryEntityCopyWith<$Res> {
  _$MealEntryEntityCopyWithImpl(this._self, this._then);

  final MealEntryEntity _self;
  final $Res Function(MealEntryEntity) _then;

/// Create a copy of MealEntryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mealDayId = null,Object? category = null,Object? content = freezed,Object? photoUrl = freezed,Object? eatenAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MealCategory,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealEntryEntity].
extension MealEntryEntityPatterns on MealEntryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealEntryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealEntryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealEntryEntity value)  $default,){
final _that = this;
switch (_that) {
case _MealEntryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealEntryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MealEntryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String mealDayId,  MealCategory category,  String? content,  String? photoUrl,  DateTime? eatenAt,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealEntryEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String mealDayId,  MealCategory category,  String? content,  String? photoUrl,  DateTime? eatenAt,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _MealEntryEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String mealDayId,  MealCategory category,  String? content,  String? photoUrl,  DateTime? eatenAt,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _MealEntryEntity() when $default != null:
return $default(_that.id,_that.mealDayId,_that.category,_that.content,_that.photoUrl,_that.eatenAt,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _MealEntryEntity implements MealEntryEntity {
  const _MealEntryEntity({required this.id, required this.mealDayId, required this.category, this.content, this.photoUrl, this.eatenAt, required this.createdAt, required this.updatedAt, this.deletedAt});
  

@override final  String id;
// id
@override final  String mealDayId;
// MealDay id (MealEntry이 속해있는 테이블)
@override final  MealCategory category;
// 식단 카테고리 (아침,점심,저녁,간식)
@override final  String? content;
// 기록 내용
@override final  String? photoUrl;
// 이미지 url
@override final  DateTime? eatenAt;
// 먹은 시간 (사용자가 설정)
@override final  DateTime createdAt;
// 생성한 날짜
@override final  DateTime updatedAt;
// 수정한 날짜
@override final  DateTime? deletedAt;

/// Create a copy of MealEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealEntryEntityCopyWith<_MealEntryEntity> get copyWith => __$MealEntryEntityCopyWithImpl<_MealEntryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealEntryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.mealDayId, mealDayId) || other.mealDayId == mealDayId)&&(identical(other.category, category) || other.category == category)&&(identical(other.content, content) || other.content == content)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,mealDayId,category,content,photoUrl,eatenAt,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'MealEntryEntity(id: $id, mealDayId: $mealDayId, category: $category, content: $content, photoUrl: $photoUrl, eatenAt: $eatenAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MealEntryEntityCopyWith<$Res> implements $MealEntryEntityCopyWith<$Res> {
  factory _$MealEntryEntityCopyWith(_MealEntryEntity value, $Res Function(_MealEntryEntity) _then) = __$MealEntryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String mealDayId, MealCategory category, String? content, String? photoUrl, DateTime? eatenAt, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class __$MealEntryEntityCopyWithImpl<$Res>
    implements _$MealEntryEntityCopyWith<$Res> {
  __$MealEntryEntityCopyWithImpl(this._self, this._then);

  final _MealEntryEntity _self;
  final $Res Function(_MealEntryEntity) _then;

/// Create a copy of MealEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mealDayId = null,Object? category = null,Object? content = freezed,Object? photoUrl = freezed,Object? eatenAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_MealEntryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mealDayId: null == mealDayId ? _self.mealDayId : mealDayId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MealCategory,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
