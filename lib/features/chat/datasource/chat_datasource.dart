import 'package:chat_and_noti/core/util/send_firebase_message.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatDatasource {
  static final ChatDatasource _instance = ChatDatasource._();
  factory ChatDatasource() => _instance;
  ChatDatasource._();

  final fireAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireMessage = FirebaseMessaging.instance;

  Stream<List<UserModel>> getAllUsers() {
    return fireStore
        .collection('users')
        .where('user_id', isNotEqualTo: fireAuth.currentUser!.uid)
        .snapshots(includeMetadataChanges: false)
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return UserModel.fromJson(doc.data());
          }).toList();
        });
  }

  Future<void> sendMessage({
    required Message message,
    required UserModel otherUser,
    required BuildContext context,
  }) async {
    await fireStore
        .collection('users')
        .doc(fireAuth.currentUser!.uid)
        .collection('chats')
        .doc(otherUser.user_id)
        .collection('messages')
        .add(message.toJson());

    await fireStore
        .collection('users')
        .doc(otherUser.user_id)
        .collection('chats')
        .doc(fireAuth.currentUser!.uid)
        .collection('messages')
        .add(message.toJson());

    sendFirebaseMessage(otherUser.fcm_token, message, "message");
  }

  Stream<List<Message>> getMessages({
    required String otherUserId,
    required BuildContext context,
  }) {
    return fireStore
        .collection('users')
        .doc(fireAuth.currentUser!.uid)
        .collection('chats')
        .doc(otherUserId)
        .collection('messages')
        .orderBy('created_at', descending: true)
        .snapshots(includeMetadataChanges: false)
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return Message.fromJson(doc.data());
          }).toList();
        });
  }
}
