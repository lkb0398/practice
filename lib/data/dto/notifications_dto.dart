import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_dto.freezed.dart';
part 'notifications_dto.g.dart';

@freezed
abstract class NotificationsDto with _$NotificationsDto {
  const factory NotificationsDto({
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'noti_id') String? notiId,
    required String label,
    required String time,
    @JsonKey(name: 'is_enabled') required bool isEnabled,
    required String timezone,
    @JsonKey(name: 'next_fire_at') required String nextFireAt,
  }) = _NotificationsDto;

  factory NotificationsDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDtoFromJson(json);
}
