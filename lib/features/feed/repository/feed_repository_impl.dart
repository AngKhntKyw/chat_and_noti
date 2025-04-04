import 'package:chat_and_noti/features/feed/datasource/feed_datasource.dart';
import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:chat_and_noti/features/feed/repository/feed_repository.dart';
import 'package:flutter/material.dart';

class FeedRepositoryImpl extends FeedRepository {
  final FeedDatasource feedDatasource;
  FeedRepositoryImpl(this.feedDatasource);

  @override
  Future<void> addFeed({
    required String feedText,
    required imageFile,
    required BuildContext context,
  }) async {
    return feedDatasource.addFeed(
      feedText: feedText,
      imageFile: imageFile,
      context: context,
    );
  }

  @override
  Stream<List<Feed>> getAllFeeds() {
    return feedDatasource.getAllFeeds();
  }
}
