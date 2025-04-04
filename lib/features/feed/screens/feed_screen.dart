import 'package:chat_and_noti/features/feed/repository/feed_repository_provider.dart';
import 'package:chat_and_noti/features/feed/screens/add_feed_screen.dart';
import 'package:chat_and_noti/features/feed/widgets/feed_card.dart';
import 'package:chat_and_noti/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerWidget {
  static const routeName = '/feed-screen';

  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
        actions: [
          IconButton(
            onPressed: () {
              navigatorKey.currentState!.pushNamed(AddFeedScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: ref.read(feedRepositoryProvider).getAllFeeds(),
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
              final feedModel = snapshot.data![index];

              return FeedCard(feedModel: feedModel);
            },
          );
        },
      ),
    );
  }
}
