import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:conversation_bubbles/conversation_bubbles.dart';
import 'package:flutter/services.dart';

class BubblesService {
  final _conversationBubblesPlugin = ConversationBubbles();
  static final instance = BubblesService._();
  BubblesService._();

  void initBubble() async {
    _conversationBubblesPlugin.init(
      appIcon: '@mipmap/ic_launcher',
      fqBubbleActivity: 'com.example.chat_and_noti.BubbleActivity',
    );
  }

  Future<void> show({
    required String title,
    required String body,
    required String imageUrl,
    UserModel? otherUser,
  }) async {
    final bytesData = await rootBundle.load('assets/images/car.jpg');
    final iconBytes = bytesData.buffer.asUint8List();

    await _conversationBubblesPlugin.show(
      appIcon: '@mipmap/ic_launcher',
      fqBubbleActivity: 'com.example.chat_and_noti.BubbleActivity',
      notificationId: 0,
      body: body,
      contentUri:
          "https://chat_and_noti.example.com/chat-screen/${otherUser!.user_id}",
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
      isFromUser: true,
      shouldMinimize: false,
    );
  }
}
