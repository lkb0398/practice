// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_datas_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalDatasDto _$GoalDatasDtoFromJson(Map<String, dynamic> json) =>
    _GoalDatasDto(
      goalId: json['goal_id'] as String?,
      dataId: json['data_id'] as String?,
      dataDate: json['data_date'] as String,
      dataValue: (json['data_value'] as num).toDouble(),
    );

Map<String, dynamic> _$GoalDatasDtoToJson(_GoalDatasDto instance) =>
    <String, dynamic>{
      'goal_id': instance.goalId,
      'data_id': instance.dataId,
      'data_date': instance.dataDate,
      'data_value': instance.dataValue,
    };
