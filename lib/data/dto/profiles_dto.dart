import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiles_dto.freezed.dart';
part 'profiles_dto.g.dart';

@freezed
abstract class ProfilesDto with _$ProfilesDto {
  const factory ProfilesDto({
    @JsonKey(name: 'user_id') required String userId,
    String? nickname,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? gender,
    @JsonKey(name: 'height_cm') num? heightCm,
    @JsonKey(name: 'weight_kg') num? weightKg,
    @JsonKey(name: 'birth_year') int? birthYear,
    @JsonKey(name: 'onboarding_completed') bool? onboardingCompleted,
  }) = _ProfilesDto;

  factory ProfilesDto.fromJson(Map<String, dynamic> json) =>
      _$ProfilesDtoFromJson(json);
}
