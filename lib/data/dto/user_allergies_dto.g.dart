// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_allergies_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAllergiesDto _$UserAllergiesDtoFromJson(Map<String, dynamic> json) =>
    _UserAllergiesDto(
      userId: json['user_id'] as String,
      allergyId: (json['allergy_id'] as num).toInt(),
    );

Map<String, dynamic> _$UserAllergiesDtoToJson(_UserAllergiesDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'allergy_id': instance.allergyId,
    };
