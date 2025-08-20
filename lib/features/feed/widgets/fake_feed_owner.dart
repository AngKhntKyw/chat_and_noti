import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FakeFeedOwner extends StatelessWidget {
  const FakeFeedOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: ScreenSize.getScreenSize(context).width / 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("----------------"),
              Text("--------------------------"),
            ],
          ),
        ],
      ),
    );
  }
}
