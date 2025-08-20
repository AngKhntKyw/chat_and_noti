import 'package:chat_and_noti/features/notification/datasource/notification_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationDatasourceProvider = Provider<NotificationDatasource>((ref) {
  return NotificationDatasource();
});
