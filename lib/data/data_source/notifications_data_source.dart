import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/data/dto/notifications_dto.dart';

abstract interface class NotificationDataSource {
  Future<List<NotificationsDto>?> getAllNotis();
  Future<void> saveNoti(NotificationsDto dto);
  Future<void> updateNoti(NotificationsDto dto);
  Future<void> deleteNoti(String notiId);
}

class NotificationsDataSourceImpl implements NotificationDataSource {
  NotificationsDataSourceImpl(this.client);

  final SupabaseClient client;

  @override // R (전체)
  Future<List<NotificationsDto>?> getAllNotis() async {
    try {
      final response = await client
          .from('notifications')
          .select()
          .order('time', ascending: true) // 알림 시간순 정렬
          .order('created_at', ascending: true);
      return (response as List)
          .map((e) => NotificationsDto.fromJson(e))
          .toList();
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 getAllNotis 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 getAllNotis 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // C
  Future<void> saveNoti(NotificationsDto dto) async {
    try {
      final map = {
        'user_id': dto.userId,
        'label': dto.label,
        'time': dto.time,
        'is_enabled': dto.isEnabled,
        'timezone': dto.timezone,
        'next_fire_at': dto.nextFireAt,
      };
      await client.from('notifications').insert(map);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 saveNoti 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 saveNoti 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // U
  Future<void> updateNoti(NotificationsDto dto) async {
    try {
      final map = {
        'label': dto.label,
        'time': dto.time,
        'is_enabled': dto.isEnabled,
        'timezone': dto.timezone,
        'next_fire_at': dto.nextFireAt,
      };
      await client.from('notifications').update(map).eq('noti_id', dto.notiId!);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 updateNoti 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 updateNoti 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override // D
  Future<void> deleteNoti(String notiId) async {
    try {
      await client.from('notifications').delete().eq('noti_id', notiId);
    } on PostgrestException catch (e, s) {
      log('DB 오류로 인한 deleteNoti 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 deleteNoti 실패 : e', error: e, stackTrace: s);
      rethrow;
    }
  }
}
