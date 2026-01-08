import 'package:vitameal/data/dto/user_allergies_dto.dart';
import 'package:vitameal/domain/entity/user_allergies_entity.dart';

extension UserAllergiesMapper on UserAllergiesEntity {
  UserAllergiesDto toDto() {
    return UserAllergiesDto(userId: userId, allergyId: allergyId);
  }
}
