import 'package:chat_and_noti/features/notification/model/notification.dart';
import 'package:flutter/material.dart' show BuildContext;

abstract class NotificationRepository {
  Future<void> addNotification({
    required String notiText,
    required BuildContext context,
    required String feedId,
  });

  Stream<List<Notification>> getAllNotifications();
  Future<void> readNotification({required String notificationId});
}
