import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/datasource/chat_datasource.dart';
import 'package:chat_and_noti/features/chat/model/message.dart';
import 'package:chat_and_noti/features/chat/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatDatasource chatDatasource;
  ChatRepositoryImpl(this.chatDatasource);

  @override
  Stream<List<UserModel>> getAllUsers() {
    return chatDatasource.getAllUsers();
  }

  @override
  Stream<List<Message>> getMessages({
    required String otherUserId,
    required BuildContext context,
  }) {
    return chatDatasource.getMessages(
      otherUserId: otherUserId,
      context: context,
    );
  }

  @override
  Future<void> sendMessage({
    required Message message,
    required UserModel otherUser,
    required BuildContext context,
  }) async {
    await chatDatasource.sendMessage(
      message: message,
      otherUser: otherUser,
      context: context,
    );
  }
}
