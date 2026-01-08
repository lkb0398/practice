import 'package:vitameal/data/dto/diseases_dto.dart';
import 'package:vitameal/domain/entity/diseases_entity.dart';

extension DiseasesMapper on DiseasesDto {
  DiseasesEntity toEntity() {
    return DiseasesEntity(id: id, name: name);
  }
}
