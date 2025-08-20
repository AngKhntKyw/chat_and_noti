import 'package:avatar_stack/animated_avatar_stack.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_and_noti/core/constant/common_network_image.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:chat_and_noti/features/feed/widgets/feed_owner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import 'package:tiktok_tap_heart_animation/tiktok_tap_heart_animation.dart';

class FeedDetailCard extends StatelessWidget {
  final Feed feedModel;
  const FeedDetailCard({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {
    return TikTokTapHeart(
      onLike: () {},
      animationDuration: Duration(milliseconds: 500),
      likeIconColor: Colors.white,
      likeIconSize: 120,
      child: Container(
        key: ValueKey(feedModel.id),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            strokeAlign: 0.2,
            width: 0.2,
          ),
        ),

        child: SingleChildScrollView(
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
              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReactionButton<String>(
                    onReactionChanged: (Reaction<String>? reaction) {
                      debugPrint('Selected value: ${reaction?.value}');
                    },
                    reactions: <Reaction<String>>[
                      Reaction<String>(
                        value: 'like',
                        icon: Icon(Icons.thumb_up),
                      ),
                      Reaction<String>(
                        value: 'love',
                        icon: Icon(Icons.favorite),
                      ),
                      Reaction<String>(
                        value: 'dislike',
                        icon: Icon(Icons.thumb_down),
                      ),
                    ],

                    itemSize: Size(
                      ScreenSize.getScreenSize(context).height / 20,
                      ScreenSize.getScreenSize(context).height / 20,
                    ),

                    selectedReaction: Reaction<String>(
                      value: 'like_fill',
                      icon: Icon(Icons.thumb_up),
                    ),
                    animateBox: true,
                    toggle: true,
                  ),
                  AnimatedAvatarStack(
                    height: ScreenSize.getScreenSize(context).height / 30,
                    width: ScreenSize.getScreenSize(context).width / 2.5,
                    avatars: [
                      for (var n = 0; n < 19; n++)
                        CachedNetworkImageProvider(
                          'https://i.pravatar.cc/150?img=$n',
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
