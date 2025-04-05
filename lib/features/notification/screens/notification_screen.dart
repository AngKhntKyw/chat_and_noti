import 'package:chat_and_noti/features/notification/repository/notification_repository_provider.dart';
import 'package:chat_and_noti/features/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationScreen extends ConsumerWidget {
  static const routeName = '/notification-screen';

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification")),
      body: StreamBuilder(
        stream: ref.read(notificationRepositoryProvider).getAllNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final notificationModel = snapshot.data![index];

              return NotificationCard(notificationModel);
            },
          );
        },
      ),
    );
  }
}
