import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:flutter/material.dart';

abstract class FeedRepository {
  Stream<List<Feed>> getAllFeeds();

  Future<void> addFeed({
    required String feedText,
    required imageFile,
    required BuildContext context,
  });
}
