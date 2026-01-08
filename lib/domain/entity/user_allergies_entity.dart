import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_allergies_entity.freezed.dart';

@freezed
abstract class UserAllergiesEntity with _$UserAllergiesEntity {
  const factory UserAllergiesEntity({
    required String userId,
    required int allergyId,
  }) = _UserAllergiesEntity;
}
