// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfilesDto _$ProfilesDtoFromJson(Map<String, dynamic> json) => _ProfilesDto(
  userId: json['user_id'] as String,
  nickname: json['nickname'] as String?,
  photoUrl: json['photo_url'] as String?,
  gender: json['gender'] as String?,
  heightCm: json['height_cm'] as num?,
  weightKg: json['weight_kg'] as num?,
  birthYear: (json['birth_year'] as num?)?.toInt(),
  onboardingCompleted: json['onboarding_completed'] as bool?,
);

Map<String, dynamic> _$ProfilesDtoToJson(_ProfilesDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'nickname': instance.nickname,
      'photo_url': instance.photoUrl,
      'gender': instance.gender,
      'height_cm': instance.heightCm,
      'weight_kg': instance.weightKg,
      'birth_year': instance.birthYear,
      'onboarding_completed': instance.onboardingCompleted,
    };
