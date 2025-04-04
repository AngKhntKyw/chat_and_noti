import 'package:chat_and_noti/features/feed/datasource/feed_datasource_provider.dart';
import 'package:chat_and_noti/features/feed/repository/feed_repository.dart';
import 'package:chat_and_noti/features/feed/repository/feed_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  final authDatasource = ref.watch(feedDatasourceProvider);
  return FeedRepositoryImpl(authDatasource);
});
