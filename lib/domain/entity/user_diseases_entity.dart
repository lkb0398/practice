import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_diseases_entity.freezed.dart';

@freezed
abstract class UserDiseasesEntity with _$UserDiseasesEntity {
  const factory UserDiseasesEntity({
    required String userId,
    required int diseaseId,
  }) = _UserDiseasesEntity;
}
