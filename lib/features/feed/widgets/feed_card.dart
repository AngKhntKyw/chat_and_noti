import 'package:chat_and_noti/core/constant/common_network_image.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:chat_and_noti/features/feed/widgets/feed_Owner.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final Feed feedModel;
  const FeedCard({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          strokeAlign: 0.1,
          width: 0.1,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          FeedOwner(feedModel: feedModel),

          SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

          Text(feedModel.feed_text),

          SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

          CommonNetworkImage(imageUrl: feedModel.image),
        ],
      ),
    );
  }
}
