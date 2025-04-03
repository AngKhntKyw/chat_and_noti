import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/model/message.dart';
import 'package:flutter/material.dart';

abstract class ChatRepository {
  Stream<List<UserModel>> getAllUsers();
  Future<void> sendMessage({
    required Message message,
    required UserModel otherUser,
    required BuildContext context,
  });
  Stream<List<Message>> getMessages({
    required String otherUserId,
    required BuildContext context,
  });
}
