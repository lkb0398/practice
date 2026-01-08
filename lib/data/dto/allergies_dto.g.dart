// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergies_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AllergiesDto _$AllergiesDtoFromJson(Map<String, dynamic> json) =>
    _AllergiesDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AllergiesDtoToJson(_AllergiesDto instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
