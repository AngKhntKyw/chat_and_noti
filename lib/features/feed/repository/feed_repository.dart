import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FeedRepository {
  Stream<List<Feed>> getAllFeeds();

  Future<void> addFeed({
    required String feedText,
    required imageFile,
    required WidgetRef ref,
  });

  Stream<Feed> getFeedById({required String feedId});
}
