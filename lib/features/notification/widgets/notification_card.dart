import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/core/util/change_to_time_ago.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_provider.dart';
import 'package:chat_and_noti/features/feed/screens/feed_detail_screen.dart';
import 'package:chat_and_noti/features/notification/model/notification.dart'
    as custom_notification;
import 'package:chat_and_noti/features/notification/repository/notification_repository_provider.dart';
import 'package:chat_and_noti/features/notification/widgets/fake_notification_card.dart';
import 'package:chat_and_noti/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationCard extends ConsumerWidget {
  final custom_notification.Notification notificationModel;
  const NotificationCard(this.notificationModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref
          .read(authRepositoryProvider)
          .getUserById(userId: notificationModel.notification_owner_id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return FakeNotificationCard();
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final notificationOwner = snapshot.data!;

        return ListTile(
          onTap: () {
            navigatorKey.currentState!.pushNamed(
              FeedDetailScreen.routeName,
              arguments: notificationModel.feed_id,
            );
            notificationModel.is_read
                ? null
                : ref
                    .read(notificationRepositoryProvider)
                    .readNotification(
                      notificationId: notificationModel.notification_id,
                    );
          },
          tileColor:
              notificationModel.is_read
                  ? Colors.transparent
                  : Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
          leading: CircleAvatar(
            radius: ScreenSize.getScreenSize(context).height / 50,
            backgroundImage: CachedNetworkImageProvider(
              notificationOwner.profile_url,
            ),
          ),
          title: Text(notificationModel.notiText),
          subtitle: Text(
            changeToTimeAgo(notificationModel.created_at.toString()),
          ),
        );
      },
    );
  }
}
