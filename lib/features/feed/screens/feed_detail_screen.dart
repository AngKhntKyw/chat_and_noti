import 'package:chat_and_noti/features/feed/repository/feed_repository_provider.dart';
import 'package:chat_and_noti/features/feed/widgets/feed_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedDetailScreen extends ConsumerWidget {
  final String feedId;

  static const routeName = '/feed-detail-screen';

  const FeedDetailScreen({super.key, required this.feedId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: ref.read(feedRepositoryProvider).getFeedById(feedId: feedId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final feedModel = snapshot.data!;
          return FeedDetailCard(feedModel: feedModel);
        },
      ),
    );
  }
}
