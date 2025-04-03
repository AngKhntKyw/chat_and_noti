import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/screens/chat_screen.dart';
import 'package:chat_and_noti/main.dart';
import 'package:flutter/material.dart';

class UserModelListTile extends StatelessWidget {
  final UserModel userModel;
  const UserModelListTile({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        navigatorKey.currentState!.pushNamed(
          ChatScreen.routeName,
          arguments: userModel,
        );
      },
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        radius: ScreenSize.getScreenSize(context).height / 46,
        backgroundImage: CachedNetworkImageProvider(userModel.profile_url),
      ),
      title: Text(userModel.name),
    );
  }
}
