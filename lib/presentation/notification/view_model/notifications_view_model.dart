import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/notifications_entity.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';

part 'notifications_view_model.g.dart';

@riverpod
class NotificationsViewModel extends _$NotificationsViewModel {
  @override
  void build() {}

  Future<void> saveNoti({
    required String label,
    required TimeOfDay time,
    required bool isEnabled,
    required String timezone,
    required DateTime nextFireAt,
  }) async {
    final userId = ref.read(userIdProvider);
    await ref
        .read(notificationsRepositoryProvider)
        .saveNoti(
          NotificationsEntity(
            userId: userId,
            label: label,
            time: time,
            isEnabled: isEnabled,
            timezone: timezone,
            nextFireAt: nextFireAt,
          ),
        );
  }

  Future<void> updateNoti({
    required String notiId,
    required String label,
    required TimeOfDay time,
    required bool isEnabled,
    required String timezone,
    required DateTime nextFireAt,
  }) async {
    await ref
        .read(notificationsRepositoryProvider)
        .updateNoti(
          NotificationsEntity(
            notiId: notiId,
            label: label,
            time: time,
            isEnabled: isEnabled,
            timezone: timezone,
            nextFireAt: nextFireAt,
          ),
        );
  }

  Future<void> deleteNoti(String notiId) async {
    await ref.read(notificationsRepositoryProvider).deleteNoti(notiId);
  }
}
