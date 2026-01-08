import 'package:flutter/material.dart';
import 'package:vitameal/data/dto/notifications_dto.dart';
import 'package:vitameal/domain/entity/notifications_entity.dart';

class NotificationsMapper {
  // Entity > Dto
  static NotificationsDto toDto(NotificationsEntity entity) {
    return NotificationsDto(
      userId: entity.userId,
      notiId: entity.notiId,
      label: entity.label,
      time: timeOfDayToString(entity.time),
      isEnabled: entity.isEnabled,
      timezone: entity.timezone,
      nextFireAt: entity.nextFireAt.toIso8601String(),
    );
  }

  // Dto > Entity
  static NotificationsEntity toEntity(NotificationsDto dto) {
    return NotificationsEntity(
      userId: dto.userId,
      notiId: dto.notiId,
      label: dto.label,
      time: stringToTimeOfDay(dto.time),
      isEnabled: dto.isEnabled,
      timezone: dto.timezone,
      nextFireAt: DateTime.parse(dto.nextFireAt),
    );
  }

  // TimeOfDay > "HH:mm"
  static String timeOfDayToString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // "HH:mm" > TimeOfDay
  static TimeOfDay stringToTimeOfDay(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
