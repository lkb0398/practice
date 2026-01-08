import 'package:vitameal/data/dto/tag_dto.dart';
import 'package:vitameal/domain/entity/tag_entity.dart';

extension TagDtoMapper on TagDto {
  /// DTO를 Domain Entity로 변환
  TagEntity toEntity() {
    return TagEntity(id: id, name: name);
  }
}
