import 'package:vitameal/data/dto/profiles_dto.dart';
import 'package:vitameal/domain/entity/profiles_entity.dart';
import 'package:vitameal/domain/enum/gender_type_enum.dart';

class ProfilesMapper {
  // Entity > Dto
  static ProfilesDto toDto(ProfilesEntity entity) {
    return ProfilesDto(
      userId: entity.userId,
      nickname: entity.nickname,
      photoUrl: entity.photoUrl,
      gender: entity.genderType?.name,
      heightCm: entity.heightCm,
      weightKg: entity.weightKg,
      birthYear: entity.birthYear,
      onboardingCompleted: entity.onboardingCompleted,
    );
  }

  // Dto > Entity
  static ProfilesEntity toEntity(ProfilesDto dto) {
    return ProfilesEntity(
      userId: dto.userId,
      nickname: dto.nickname,
      photoUrl: dto.photoUrl,
      genderType: dto.gender != null
          ? GenderType.values.byName(dto.gender!)
          : null,
      heightCm: dto.heightCm?.toDouble(),
      weightKg: dto.weightKg?.toDouble(),
      birthYear: dto.birthYear,
      onboardingCompleted: dto.onboardingCompleted,
    );
  }

  // 업데이트 용
  static Map<String, dynamic> toUpdateMap(ProfilesEntity entity) {
    final map = <String, dynamic>{};
    if (entity.nickname != null) map['nickname'] = entity.nickname;
    if (entity.photoUrl != null) map['photo_url'] = entity.photoUrl;
    if (entity.gender != null) map['gender'] = entity.genderType!.name;
    if (entity.birthYear != null) map['birth_year'] = entity.birthYear;
    if (entity.heightCm != null) map['height_cm'] = entity.heightCm;
    if (entity.weightKg != null) map['weight_kg'] = entity.weightKg;
    if (entity.onboardingCompleted != null) {
      map['onboarding_completed'] = entity.onboardingCompleted;
    }

    return map;
  }
}
