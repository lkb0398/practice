// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_diseases_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDiseasesDto _$UserDiseasesDtoFromJson(Map<String, dynamic> json) =>
    _UserDiseasesDto(
      userId: json['user_id'] as String,
      diseaseId: (json['disease_id'] as num).toInt(),
    );

Map<String, dynamic> _$UserDiseasesDtoToJson(_UserDiseasesDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'disease_id': instance.diseaseId,
    };
