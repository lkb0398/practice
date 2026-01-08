import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_entity.freezed.dart';

@freezed
abstract class TagEntity with _$TagEntity {
  const factory TagEntity({required int id, required String name}) = _TagEntity;
}
