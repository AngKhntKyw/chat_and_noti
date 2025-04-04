import 'package:chat_and_noti/features/feed/datasource/feed_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedDatasourceProvider = Provider<FeedDatasource>((ref) {
  return FeedDatasource();
});
