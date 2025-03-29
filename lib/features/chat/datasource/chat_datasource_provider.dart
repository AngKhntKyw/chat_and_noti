import 'package:chat_and_noti/features/chat/datasource/chat_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatDatasourceProvider = Provider<ChatDatasource>((ref) {
  return ChatDatasource();
});
