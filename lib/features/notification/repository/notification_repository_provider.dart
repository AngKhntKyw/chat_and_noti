import 'package:chat_and_noti/features/notification/datasource/notification_datasource_provider.dart';
import 'package:chat_and_noti/features/notification/repository/notification_repository.dart';
import 'package:chat_and_noti/features/notification/repository/notification_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final notificationDatasource = ref.watch(notificationDatasourceProvider);
  return NotificationRepositoryImpl(notificationDatasource);
});
