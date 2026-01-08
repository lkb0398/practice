// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationsDto _$NotificationsDtoFromJson(Map<String, dynamic> json) =>
    _NotificationsDto(
      userId: json['user_id'] as String?,
      notiId: json['noti_id'] as String?,
      label: json['label'] as String,
      time: json['time'] as String,
      isEnabled: json['is_enabled'] as bool,
      timezone: json['timezone'] as String,
      nextFireAt: json['next_fire_at'] as String,
    );

Map<String, dynamic> _$NotificationsDtoToJson(_NotificationsDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'noti_id': instance.notiId,
      'label': instance.label,
      'time': instance.time,
      'is_enabled': instance.isEnabled,
      'timezone': instance.timezone,
      'next_fire_at': instance.nextFireAt,
    };
