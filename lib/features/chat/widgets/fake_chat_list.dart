import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FakeChatList extends StatelessWidget {
  const FakeChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: ScreenSize.getScreenSize(context).width / 40),
            Text("-----------------------------------"),
          ],
        ),
      ),
    );
  }
}
