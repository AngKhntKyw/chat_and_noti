import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_and_noti/auth_gate.dart';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_provider.dart';
import 'package:chat_and_noti/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({super.key});

  void logout(WidgetRef ref) async {
    await ref.read(authRepositoryProvider).logout(context: ref.context);
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AuthGate.routeName,
      (route) => false,
    );
  }

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
                  radius: ScreenSize.getScreenSize(context).height / 18,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    radius: ScreenSize.getScreenSize(context).height / 20,
                    backgroundImage: CachedNetworkImageProvider(
                      feedOwner.profile_url,
                    ),
                  ),
                ),

                SizedBox(height: ScreenSize.getScreenSize(context).height / 60),

                Text(
                  feedOwner.name,
                  style: TextStyle(
                    fontSize: ScreenSize.getScreenSize(context).height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: ScreenSize.getScreenSize(context).height / 100,
                ),

                Text(feedOwner.email),

                SizedBox(height: ScreenSize.getScreenSize(context).height / 60),

                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.5),
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
                        onTap: () => logout(ref),
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
        },
      ),
    );
  }
}
