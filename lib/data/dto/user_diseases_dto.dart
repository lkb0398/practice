import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_diseases_dto.freezed.dart';
part 'user_diseases_dto.g.dart';

@freezed
abstract class UserDiseasesDto with _$UserDiseasesDto {
  const factory UserDiseasesDto({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'disease_id') required int diseaseId,
  }) = _UserDiseasesDto;

  factory UserDiseasesDto.fromJson(Map<String, dynamic> json) =>
      _$UserDiseasesDtoFromJson(json);
}
