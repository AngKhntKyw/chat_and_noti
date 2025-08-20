import 'dart:convert';
import 'dart:developer';
import 'package:chat_and_noti/core/util/get_access_token.dart';
import 'package:chat_and_noti/features/chat/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

void sendFirebaseMessage(
  String token,
  Message messageModel,
  String type,
) async {
  final fireAuth = FirebaseAuth.instance;
  String serverKey = await getAcessToken();

  String endPointFirebaseCloudMessaging =
      "https://fcm.googleapis.com/v1/projects/chat-and-noti/messages:send";

  final Map<String, dynamic> message = {
    'message': {
      'token': token,
      'notification': {
        'title':
            type == "message"
                ? "${fireAuth.currentUser!.displayName} sends you a message"
                : "${fireAuth.currentUser!.displayName} adds a feed",
        'body': messageModel.message,
      },
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'message': 'Custom data payload',
        'sender_id': fireAuth.currentUser!.uid,
        'type': type,
      },
    },
  };

  final response = await http.post(
    Uri.parse(endPointFirebaseCloudMessaging),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    },
    body: jsonEncode(message),
  );
  if (response.statusCode == 200) {
    log("FCM message sent successfully!");
  } else {
    log("Failed to send FCM message: ${response.body}");
  }
}
