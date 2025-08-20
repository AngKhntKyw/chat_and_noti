import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FakeFeedCard extends StatelessWidget {
  const FakeFeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
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
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: ScreenSize.getScreenSize(context).width / 40),

                Text("------------------"),
              ],
            ),
            SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

            Text("-----------------------------------"),
            SizedBox(height: ScreenSize.getScreenSize(context).height / 40),
            Skeletonizer(
              enabled: true,
              child: CachedNetworkImage(
                imageUrl: '',
                height: ScreenSize.getScreenSize(context).width / 1.5,
                width: ScreenSize.getScreenSize(context).width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
