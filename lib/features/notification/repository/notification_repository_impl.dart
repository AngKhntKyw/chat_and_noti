import 'package:chat_and_noti/features/notification/datasource/notification_datasource.dart';
import 'package:chat_and_noti/features/notification/model/notification.dart';
import 'package:chat_and_noti/features/notification/repository/notification_repository.dart';
import 'package:flutter/material.dart' show BuildContext;

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDatasource notificationDatasource;
  NotificationRepositoryImpl(this.notificationDatasource);

  @override
  Future<void> addNotification({
    required String notiText,
    required BuildContext context,
    required String feedId,
  }) async {
    notificationDatasource.addNotification(
      notiText: notiText,
      context: context,
      feedId: feedId,
    );
  }

  @override
  Stream<List<Notification>> getAllNotifications() {
    return notificationDatasource.getAllNotifications();
  }

  @override
  Future<void> readNotification({required String notificationId}) async {
    notificationDatasource.readNotification(notificationId: notificationId);
  }
}
