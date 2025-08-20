import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const Notification._();

  const factory Notification({
    required String notification_id,
    required String feed_id,
    required String notiText,
    required bool is_read,
    required DateTime created_at,
    required String notification_owner_id,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
