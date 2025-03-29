import 'dart:developer';
import 'package:conversation_bubbles/conversation_bubbles.dart';
import 'package:flutter/services.dart';

final _conversationBubblesPlugin = ConversationBubbles();

void initBubble() async {
  _conversationBubblesPlugin.init(
    appIcon: '@mipmap/ic_launcher',
    fqBubbleActivity: 'com.example.ober_version_2.BubbleActivity',
  );
}

Future<void> show({
  required String title,
  required String body,
  required String imageUrl,
}) async {
  log("sadafsaf");
  final bytesData = await rootBundle.load('assets/images/car.jpg');
  final iconBytes = bytesData.buffer.asUint8List();

  await _conversationBubblesPlugin.show(
    appIcon: '@mipmap/ic_launcher',
    fqBubbleActivity: 'com.example.chat_and_noti.BubbleActivity',
    notificationId: 0,
    body: body,
    contentUri: "chat_and_noti.example.com/",
    channel: const NotificationChannel(
      id: 'chat',
      name: 'chat',
      description: 'chat',
    ),
    person: Person(id: "0", name: title, icon: iconBytes),
    isFromUser: true,
    shouldMinimize: false,
  );
}
