import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/core/util/change_to_time_ago.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_provider.dart';
import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedOwner extends ConsumerWidget {
  final Feed feedModel;
  const FeedOwner({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref
          .read(authRepositoryProvider)
          .getUserById(userId: feedModel.feed_owner_id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final feedOwner = snapshot.data!;

        return Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              radius: ScreenSize.getScreenSize(context).height / 50,
              backgroundImage: CachedNetworkImageProvider(
                feedOwner.profile_url,
              ),
            ),

            SizedBox(width: ScreenSize.getScreenSize(context).width / 40),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feedOwner.name),
                Text(changeToTimeAgo("${feedModel.created_at}")),
              ],
            ),
          ],
        );
      },
    );
  }
}
