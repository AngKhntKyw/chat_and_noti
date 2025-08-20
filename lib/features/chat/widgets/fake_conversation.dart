import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FakeConversation extends StatelessWidget {
  const FakeConversation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Skeletonizer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: ScreenSize.getScreenSize(context).height / 20,
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("----------------------------------------"),
                      Text("-----------------"),
                    ],
                  ),
                ),
                Container(
                  height: ScreenSize.getScreenSize(context).height / 20,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("-----------------------------"),
                      Text("-----------------"),
                    ],
                  ),
                ),
                Text("--------------------"),
              ],
            ),
          ),
        );
      },
    );
  }
}
