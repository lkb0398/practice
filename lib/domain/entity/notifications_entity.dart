import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_entity.freezed.dart';

@freezed
abstract class NotificationsEntity with _$NotificationsEntity {
  const factory NotificationsEntity({
    String? userId,
    String? notiId,
    required String label,
    required TimeOfDay time,
    required bool isEnabled,
    required String timezone,
    required DateTime nextFireAt,
  }) = _NotificationsEntity;
}
