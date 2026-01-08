import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_allergies_dto.freezed.dart';
part 'user_allergies_dto.g.dart';

@freezed
abstract class UserAllergiesDto with _$UserAllergiesDto {
  const factory UserAllergiesDto({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'allergy_id') required int allergyId,
  }) = _UserAllergiesDto;

  factory UserAllergiesDto.fromJson(Map<String, dynamic> json) =>
      _$UserAllergiesDtoFromJson(json);
}
