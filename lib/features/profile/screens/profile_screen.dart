import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fireAuth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: StreamBuilder(
        stream: ref
            .read(authRepositoryProvider)
            .getUserById(userId: fireAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final feedOwner = snapshot.data!;

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  radius: ScreenSize.getScreenSize(context).height / 20,
                  backgroundImage: CachedNetworkImageProvider(
                    feedOwner.profile_url,
                  ),
                ),

                SizedBox(width: ScreenSize.getScreenSize(context).width / 40),

                Text(feedOwner.name),

                SizedBox(width: ScreenSize.getScreenSize(context).width / 40),

                Text(feedOwner.email),
              ],
            ),
          );
        },
      ),
    );
  }
}
