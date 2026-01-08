import 'package:freezed_annotation/freezed_annotation.dart';

part 'diseases_entity.freezed.dart';

@freezed
abstract class DiseasesEntity with _$DiseasesEntity {
  const factory DiseasesEntity({required int id, required String name}) =
      _DiseasesEntity;
}
