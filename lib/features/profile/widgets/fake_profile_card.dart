import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FakeProfileCard extends StatelessWidget {
  const FakeProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: ScreenSize.getScreenSize(context).height / 20),
          SizedBox(height: ScreenSize.getScreenSize(context).height / 60),

          Text("---------------------"),

          SizedBox(height: ScreenSize.getScreenSize(context).height / 100),

          Text("-------------------------------"),

          SizedBox(height: ScreenSize.getScreenSize(context).height / 60),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Edit profile"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(color: Theme.of(context).colorScheme.primary),

                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(color: Theme.of(context).colorScheme.primary),

                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About us"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),

                Divider(color: Theme.of(context).colorScheme.primary),

                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
