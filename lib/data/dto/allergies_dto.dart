import 'package:freezed_annotation/freezed_annotation.dart';

part 'allergies_dto.freezed.dart';
part 'allergies_dto.g.dart';

@freezed
abstract class AllergiesDto with _$AllergiesDto {
  const factory AllergiesDto({required int id, required String name}) =
      _AllergiesDto;

  factory AllergiesDto.fromJson(Map<String, dynamic> json) =>
      _$AllergiesDtoFromJson(json);
}
