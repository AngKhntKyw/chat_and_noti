import 'dart:developer';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversation_bubbles/conversation_bubbles.dart';
import 'package:http/http.dart' as http;

class BubblesService {
  static final instance = BubblesService._();
  BubblesService._();

  final _conversationBubblesPlugin = ConversationBubbles();

  bool _isInBubble = false;
  bool get isInBubble => _isInBubble;

  UserModel? _launchUserModel;
  UserModel? get launchUserModel => _launchUserModel;

  final fireStore = FirebaseFirestore.instance;

  Future<void> init() async {
    _conversationBubblesPlugin.init(
      appIcon: '@mipmap/ic_launcher',
      fqBubbleActivity: 'com.example.chat_and_noti.BubbleActivity',
    );
    _isInBubble = await _conversationBubblesPlugin.isInBubble();
    //
    final intentUri = await ConversationBubbles().getIntentUri();
    if (intentUri != null) {
      String id = intentUri.split('/').last;
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await fireStore.collection('users').doc(id).get();

      final userModel = documentSnapshot.data() as Map<String, dynamic>;
      _launchUserModel = UserModel.fromJson(userModel);
    } else {
      log("Intent URL is null");
    }
  }

  Future<void> show(
    UserModel otherUser,
    String messageText, {
    bool shouldAutoExpand = false,
  }) async {
    final http.Response response = await http.get(
      Uri.parse(otherUser.profile_url),
    );
    await _conversationBubblesPlugin.show(
      notificationId: otherUser.hashCode,
      body: messageText,
      contentUri:
          'https://chat_and_noti.example.com/chat-screen/${otherUser.user_id}',

      channel: NotificationChannel(
        id: 'chat',
        name: 'chat',
        description: 'chat',
      ),

      person: Person(
        id: otherUser.user_id,
        name: otherUser.name,
        icon: response.bodyBytes,
      ),

      isFromUser: shouldAutoExpand,
      shouldMinimize: shouldAutoExpand,
      appIcon: '@mipmap/ic_launcher',
      fqBubbleActivity: 'com.example.chat_and_noti.BubbleActivity',
    );
  }
}
