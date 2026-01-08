import 'package:freezed_annotation/freezed_annotation.dart';

part 'diseases_dto.freezed.dart';
part 'diseases_dto.g.dart';

@freezed
abstract class DiseasesDto with _$DiseasesDto {
  const factory DiseasesDto({required int id, required String name}) =
      _DiseasesDto;

  factory DiseasesDto.fromJson(Map<String, dynamic> json) =>
      _$DiseasesDtoFromJson(json);
}
