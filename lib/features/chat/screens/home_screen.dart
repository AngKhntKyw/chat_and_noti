import 'package:chat_and_noti/auth_gate.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_provider.dart';
import 'package:chat_and_noti/features/chat/repository/chat_repository_provider.dart';
import 'package:chat_and_noti/features/chat/widgets/user_model_list_tile.dart';
import 'package:chat_and_noti/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  void logout(WidgetRef ref) async {
    await ref.read(authRepositoryProvider).logout(context: ref.context);
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AuthGate.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () => logout(ref),
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),

      body: StreamBuilder(
        stream: ref.read(chatRepositoryProvider).getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final userModel = snapshot.data![index];
              return UserModelListTile(userModel: userModel);
            },
          );
        },
      ),
    );
  }
}
