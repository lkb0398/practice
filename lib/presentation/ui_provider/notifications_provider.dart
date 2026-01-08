import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/notifications_entity.dart';

part 'notifications_provider.g.dart';

/// 전체 알람 가져오기 Provider
@riverpod
Future<List<NotificationsEntity>?> getAllNotis(Ref ref) async {
  return await ref.read(notificationsRepositoryProvider).getAllNotis();
}
