import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// 🔔 FCM 수신 처리
class NotificationService {
  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // 로컬 알림 초기화
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const settings = InitializationSettings(android: androidInit, iOS: iosInit);
    await plugin.initialize(settings);

    // 시스템 알림 허용 (Background, Terminated, iOS Foreground 용)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    // Foreground 수신 > 로컬 알림 (Android Foreground 용)
    FirebaseMessaging.onMessage.listen((message) async {
      if (Platform.isAndroid) {
        await showLocalNotification(message);
      }
    });
  }

  // 알람용 고정 채널 (Android)
  static const String _channelId = 'vitameal_alarm'; // id (고정)
  static const String _channelName = 'VitaMeal Alarm'; // 채널명 (설정 화면에 노출됨)
  static const String _channelDesc = 'Scheduled alarm notifications'; // 채널설명

  // 로컬 알림 표시 (Android Foreground 용)
  static Future<void> showLocalNotification(RemoteMessage message) async {
    final data = message.data;
    final label = (data['label'] ?? message.notification?.title ?? '알람')
        .toString();
    final time = (data['time'] ?? '').toString();

    // 🤍 로컬 알림 커스텀
    final title = 'Vitameal';
    final body = '$time $label 알람입니다';

    // Android
    final androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.max, // 알림 중요도
      priority: Priority.high, // 알림 표시 우선순위
      playSound: true, // 알림 소리
      enableVibration: true, // 진동
      visibility: NotificationVisibility.public, // 잠금화면 표시
    );

    // iOS
    final iosDetails = DarwinNotificationDetails(
      presentAlert: true, // 배너
      presentSound: true, // 사운드
      presentBadge: true, // 배지
      threadIdentifier: _channelId, // 알림 그룹화
    );

    // alarm_id 기반 notificationId 생성
    final notiId = _stableNotificationId(data['alarm_id']?.toString());

    await plugin.show(
      notiId,
      title,
      body,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: data['alarm_id']?.toString(),
    );
  }

  // alarm_id (uuid) > int (로컬 알림 id)
  static int _stableNotificationId(String? alarmId) {
    if (alarmId == null || alarmId.isEmpty) {
      // fallback: 현재시간 기반 (중복 위험 낮음)
      return DateTime.now().millisecondsSinceEpoch.remainder(1 << 31);
    }
    // 간단한 hash: uuid 문자열의 codeUnits 합
    var hash = 0;
    for (final c in alarmId.codeUnits) {
      hash = (hash * 31 + c) & 0x7fffffff;
    }
    return hash;
  }
}
