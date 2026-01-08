// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfilesDto {

@JsonKey(name: 'user_id') String get userId; String? get nickname;@JsonKey(name: 'photo_url') String? get photoUrl; String? get gender;@JsonKey(name: 'height_cm') num? get heightCm;@JsonKey(name: 'weight_kg') num? get weightKg;@JsonKey(name: 'birth_year') int? get birthYear;@JsonKey(name: 'onboarding_completed') bool? get onboardingCompleted;
/// Create a copy of ProfilesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilesDtoCopyWith<ProfilesDto> get copyWith => _$ProfilesDtoCopyWithImpl<ProfilesDto>(this as ProfilesDto, _$identity);

  /// Serializes this ProfilesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfilesDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,photoUrl,gender,heightCm,weightKg,birthYear,onboardingCompleted);

@override
String toString() {
  return 'ProfilesDto(userId: $userId, nickname: $nickname, photoUrl: $photoUrl, gender: $gender, heightCm: $heightCm, weightKg: $weightKg, birthYear: $birthYear, onboardingCompleted: $onboardingCompleted)';
}


}

/// @nodoc
abstract mixin class $ProfilesDtoCopyWith<$Res>  {
  factory $ProfilesDtoCopyWith(ProfilesDto value, $Res Function(ProfilesDto) _then) = _$ProfilesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String? nickname,@JsonKey(name: 'photo_url') String? photoUrl, String? gender,@JsonKey(name: 'height_cm') num? heightCm,@JsonKey(name: 'weight_kg') num? weightKg,@JsonKey(name: 'birth_year') int? birthYear,@JsonKey(name: 'onboarding_completed') bool? onboardingCompleted
});




}
/// @nodoc
class _$ProfilesDtoCopyWithImpl<$Res>
    implements $ProfilesDtoCopyWith<$Res> {
  _$ProfilesDtoCopyWithImpl(this._self, this._then);

  final ProfilesDto _self;
  final $Res Function(ProfilesDto) _then;

/// Create a copy of ProfilesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? nickname = freezed,Object? photoUrl = freezed,Object? gender = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? birthYear = freezed,Object? onboardingCompleted = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as num?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as num?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,onboardingCompleted: freezed == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfilesDto].
extension ProfilesDtoPatterns on ProfilesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfilesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfilesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfilesDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfilesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfilesDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfilesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String? nickname, @JsonKey(name: 'photo_url')  String? photoUrl,  String? gender, @JsonKey(name: 'height_cm')  num? heightCm, @JsonKey(name: 'weight_kg')  num? weightKg, @JsonKey(name: 'birth_year')  int? birthYear, @JsonKey(name: 'onboarding_completed')  bool? onboardingCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfilesDto() when $default != null:
return $default(_that.userId,_that.nickname,_that.photoUrl,_that.gender,_that.heightCm,_that.weightKg,_that.birthYear,_that.onboardingCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String? nickname, @JsonKey(name: 'photo_url')  String? photoUrl,  String? gender, @JsonKey(name: 'height_cm')  num? heightCm, @JsonKey(name: 'weight_kg')  num? weightKg, @JsonKey(name: 'birth_year')  int? birthYear, @JsonKey(name: 'onboarding_completed')  bool? onboardingCompleted)  $default,) {final _that = this;
switch (_that) {
case _ProfilesDto():
return $default(_that.userId,_that.nickname,_that.photoUrl,_that.gender,_that.heightCm,_that.weightKg,_that.birthYear,_that.onboardingCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId,  String? nickname, @JsonKey(name: 'photo_url')  String? photoUrl,  String? gender, @JsonKey(name: 'height_cm')  num? heightCm, @JsonKey(name: 'weight_kg')  num? weightKg, @JsonKey(name: 'birth_year')  int? birthYear, @JsonKey(name: 'onboarding_completed')  bool? onboardingCompleted)?  $default,) {final _that = this;
switch (_that) {
case _ProfilesDto() when $default != null:
return $default(_that.userId,_that.nickname,_that.photoUrl,_that.gender,_that.heightCm,_that.weightKg,_that.birthYear,_that.onboardingCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfilesDto implements ProfilesDto {
  const _ProfilesDto({@JsonKey(name: 'user_id') required this.userId, this.nickname, @JsonKey(name: 'photo_url') this.photoUrl, this.gender, @JsonKey(name: 'height_cm') this.heightCm, @JsonKey(name: 'weight_kg') this.weightKg, @JsonKey(name: 'birth_year') this.birthYear, @JsonKey(name: 'onboarding_completed') this.onboardingCompleted});
  factory _ProfilesDto.fromJson(Map<String, dynamic> json) => _$ProfilesDtoFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override final  String? nickname;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override final  String? gender;
@override@JsonKey(name: 'height_cm') final  num? heightCm;
@override@JsonKey(name: 'weight_kg') final  num? weightKg;
@override@JsonKey(name: 'birth_year') final  int? birthYear;
@override@JsonKey(name: 'onboarding_completed') final  bool? onboardingCompleted;

/// Create a copy of ProfilesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfilesDtoCopyWith<_ProfilesDto> get copyWith => __$ProfilesDtoCopyWithImpl<_ProfilesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfilesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfilesDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,photoUrl,gender,heightCm,weightKg,birthYear,onboardingCompleted);

@override
String toString() {
  return 'ProfilesDto(userId: $userId, nickname: $nickname, photoUrl: $photoUrl, gender: $gender, heightCm: $heightCm, weightKg: $weightKg, birthYear: $birthYear, onboardingCompleted: $onboardingCompleted)';
}


}

/// @nodoc
abstract mixin class _$ProfilesDtoCopyWith<$Res> implements $ProfilesDtoCopyWith<$Res> {
  factory _$ProfilesDtoCopyWith(_ProfilesDto value, $Res Function(_ProfilesDto) _then) = __$ProfilesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String? nickname,@JsonKey(name: 'photo_url') String? photoUrl, String? gender,@JsonKey(name: 'height_cm') num? heightCm,@JsonKey(name: 'weight_kg') num? weightKg,@JsonKey(name: 'birth_year') int? birthYear,@JsonKey(name: 'onboarding_completed') bool? onboardingCompleted
});




}
/// @nodoc
class __$ProfilesDtoCopyWithImpl<$Res>
    implements _$ProfilesDtoCopyWith<$Res> {
  __$ProfilesDtoCopyWithImpl(this._self, this._then);

  final _ProfilesDto _self;
  final $Res Function(_ProfilesDto) _then;

/// Create a copy of ProfilesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? nickname = freezed,Object? photoUrl = freezed,Object? gender = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? birthYear = freezed,Object? onboardingCompleted = freezed,}) {
  return _then(_ProfilesDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as num?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as num?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,onboardingCompleted: freezed == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
