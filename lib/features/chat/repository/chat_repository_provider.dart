import 'package:chat_and_noti/features/chat/datasource/chat_datasource_provider.dart';
import 'package:chat_and_noti/features/chat/repository/chat_repository.dart';
import 'package:chat_and_noti/features/chat/repository/chat_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final authDatasource = ref.watch(chatDatasourceProvider);
  return ChatRepositoryImpl(authDatasource);
});
