import 'dart:developer';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversation_bubbles/conversation_bubbles.dart';
import 'package:flutter/services.dart';

class BubblesService {
  final _conversationBubblesPlugin = ConversationBubbles();
  bool _isInBubble = false;
  bool get isInBubble => _isInBubble;

  UserModel? _launchUserModel;
  UserModel? get launchUserModel => _launchUserModel;

  final fireStore = FirebaseFirestore.instance;

  static final instance = BubblesService._();

  BubblesService._();

  Future<void> init() async {
    _conversationBubblesPlugin.init(
      appIcon: '@mipmap/ic_launcher',
      fqBubbleActivity: 'com.example.chat_and_noti.BubbleActivity',
    );
    _isInBubble = await _conversationBubblesPlugin.isInBubble();

    //
    final intentUri = await ConversationBubbles().getIntentUri();
    log("URL $intentUri");
    if (intentUri != null) {
      log("URL NOT NULL");
      String id = intentUri.split('/').last;
      await getUserById(userId: id);
    }
  }

  Future<void> getUserById({required String userId}) async {
    log("That works");
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await fireStore.collection('users').doc(userId).get();

    final userModel = documentSnapshot.data() as Map<String, dynamic>;
    _launchUserModel = UserModel.fromJson(userModel);
    log("UserModel $userModel");
  }

  Future<void> show(
    UserModel otherUser,
    String messageText, {
    bool shouldAutoExpand = false,
  }) async {
    final bytesData = await rootBundle.load('assets/images/car.jpg');
    final iconBytes = bytesData.buffer.asUint8List();

    await _conversationBubblesPlugin.show(
      notificationId: 0,
      body: messageText,
      contentUri:
          'https://chat_and_noti.example.com/chat-screen/${otherUser.user_id}',
      channel: const NotificationChannel(
        id: 'chat',
        name: 'Chat',
        description: 'Chat',
      ),
      person: Person(
        id: otherUser.user_id,
        name: otherUser.name,
        icon: iconBytes,
      ),
      isFromUser: shouldAutoExpand,
      shouldMinimize: shouldAutoExpand,
    );
  }
}
