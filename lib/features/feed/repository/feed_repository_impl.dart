import 'package:chat_and_noti/features/feed/datasource/feed_datasource.dart';
import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:chat_and_noti/features/feed/repository/feed_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedRepositoryImpl extends FeedRepository {
  final FeedDatasource feedDatasource;
  FeedRepositoryImpl(this.feedDatasource);

  @override
  Future<void> addFeed({
    required String feedText,
    required imageFile,
    required WidgetRef ref,
  }) async {
    return feedDatasource.addFeed(
      feedText: feedText,
      imageFile: imageFile,
      ref: ref,
    );
  }

  @override
  Stream<List<Feed>> getAllFeeds() {
    return feedDatasource.getAllFeeds();
  }

  @override
  Stream<Feed> getFeedById({required String feedId}) {
    return feedDatasource.getFeedById(feedId: feedId);
  }
}
