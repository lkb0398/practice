// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealDayDto _$MealDayDtoFromJson(Map<String, dynamic> json) => _MealDayDto(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  mealDate: json['meal_date'] as String,
  adherence: json['adherence'] as String?,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  dataVersion: (json['data_version'] as num).toInt(),
  lastEntryUpdatedAt: json['last_entry_updated_at'] as String?,
  needsAiRefresh: json['needs_ai_refresh'] as bool,
  latestAiSummary: json['latest_ai_summary'] as String?,
  deletedAt: json['deleted_at'] as String?,
);

Map<String, dynamic> _$MealDayDtoToJson(_MealDayDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'meal_date': instance.mealDate,
      'adherence': instance.adherence,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'data_version': instance.dataVersion,
      'last_entry_updated_at': instance.lastEntryUpdatedAt,
      'needs_ai_refresh': instance.needsAiRefresh,
      'latest_ai_summary': instance.latestAiSummary,
      'deleted_at': instance.deletedAt,
    };
