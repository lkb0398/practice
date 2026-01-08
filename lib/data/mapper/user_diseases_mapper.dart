import 'package:vitameal/data/dto/user_diseases_dto.dart';
import 'package:vitameal/domain/entity/user_diseases_entity.dart';

extension UserDiseasesMapper on UserDiseasesEntity {
  UserDiseasesDto toDto() {
    return UserDiseasesDto(userId: userId, diseaseId: diseaseId);
  }
}
