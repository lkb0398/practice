import 'package:vitameal/data/dto/allergies_dto.dart';
import 'package:vitameal/domain/entity/allergies_entity.dart';

extension AllergiesMapper on AllergiesDto {
  AllergiesEntity toEntity() {
    return AllergiesEntity(id: id, name: name);
  }
}
