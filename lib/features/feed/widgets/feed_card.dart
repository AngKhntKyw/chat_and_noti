import 'package:chat_and_noti/core/constant/common_network_image.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:chat_and_noti/features/feed/screens/feed_detail_screen.dart';
import 'package:chat_and_noti/features/feed/widgets/feed_Owner.dart';
import 'package:chat_and_noti/main.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import 'package:tiktok_tap_heart_animation/tiktok_tap_heart_animation.dart';

class FeedCard extends StatelessWidget {
  final Feed feedModel;
  const FeedCard({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorKey.currentState!.pushNamed(
          FeedDetailScreen.routeName,
          arguments: feedModel.id,
        );
      },
      child: TikTokTapHeart(
        onLike: () {},
        animationDuration: Duration(milliseconds: 500),
        likeIconColor: Colors.white,
        likeIconSize: 120,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              strokeAlign: 0.2,
              width: 0.2,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              FeedOwner(feedModel: feedModel),

              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              Text(feedModel.feed_text),

              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              Hero(
                tag: feedModel.image,
                child: PinchZoomReleaseUnzoomWidget(
                  minScale: 0.8,
                  maxScale: 4,
                  resetDuration: const Duration(milliseconds: 200),
                  boundaryMargin: const EdgeInsets.only(bottom: 0),
                  clipBehavior: Clip.none,
                  useOverlay: true,
                  maxOverlayOpacity: 0.5,
                  overlayColor: Colors.black,
                  fingersRequiredToPinch: 2,
                  child: CommonNetworkImage(imageUrl: feedModel.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
