import 'dart:developer';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/screens/chat_screen.dart';
import 'package:chat_and_noti/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static final instance = NotificationService._();
  NotificationService._();

  final fireMessage = FirebaseMessaging.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireAuth = FirebaseAuth.instance;

  Future<void> init() async {
    await fireMessage.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    //
    final token = await fireMessage.getToken();
    if (token != null && fireAuth.currentUser != null) {
      log("TOKEN $token");
      await fireStore.collection('users').doc(fireAuth.currentUser!.uid).update(
        {"fcm_token": token},
      );
    }

    RemoteMessage? initialMessage = await fireMessage.getInitialMessage();
    if (initialMessage != null) {
      handle(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handle);

    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        log(
          'Message also contained a notification: ${message.notification!.body}',
        );
      }
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  void handle(RemoteMessage initialMessage) async {
    log("initial Message : ${initialMessage.notification!.body}");
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await fireStore
            .collection('users')
            .doc(initialMessage.data['key1'])
            .get();
    final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
    final userModel = UserModel.fromJson(userModelMap);
    log("UserModel $userModel");
    navigatorKey.currentState!.pushNamed(
      ChatScreen.routeName,
      arguments: userModel,
    );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Handling a background message: ${message.notification!.body}");
}
