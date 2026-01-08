import 'package:freezed_annotation/freezed_annotation.dart';

part 'allergies_entity.freezed.dart';

@freezed
abstract class AllergiesEntity with _$AllergiesEntity {
  const factory AllergiesEntity({required int id, required String name}) =
      _AllergiesEntity;
}
