import 'package:chat_and_noti/core/config/bubble_service.dart';
import 'package:chat_and_noti/core/config/local_notification_service.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/screens/chat_screen.dart';
import 'package:chat_and_noti/main.dart';
import 'package:chat_and_noti/navigation_bar_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationService {
  static final instance = NotificationService._();
  NotificationService._();

  final fireMessage = FirebaseMessaging.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireAuth = FirebaseAuth.instance;

  final bubbles = BubblesService.instance;

  Future<void> init() async {
    //
    await fireMessage.requestPermission(
      alert: false,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    //
    final token = await fireMessage.getToken();
    if (token != null && fireAuth.currentUser != null) {
      await fireStore.collection('users').doc(fireAuth.currentUser!.uid).update(
        {"fcm_token": token},
      );
    }

    //

    RemoteMessage? initialMessage = await fireMessage.getInitialMessage();
    if (initialMessage != null) {
      handle(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handle);

    FirebaseMessaging.onMessage.listen((message) async {
      if (message.notification != null) {
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await fireStore
                .collection('users')
                .doc(message.data['sender_id'])
                .get();
        final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
        final userModel = UserModel.fromJson(userModelMap);
        message.data['type'] == "message"
            ? bubbles.show(userModel, message.notification!.body ?? "BODY NULL")
            : LocalNotificationService.instance.showNoti(
              title: message.notification!.title ?? "TITLE NULL",
              body: message.notification!.body ?? "BODY NULL",
              imageUrl: userModel.profile_url,
              payload: message.data.toString(),
            );
      }
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  void handle(RemoteMessage initialMessage) async {
    if (initialMessage.data['type'] == "message") {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await fireStore
              .collection('users')
              .doc(initialMessage.data['sender_id'])
              .get();
      final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userModelMap);
      navigatorKey.currentState!.pushNamed(
        ChatScreen.routeName,
        arguments: userModel,
      );
    } else {
      ProviderScope.containerOf(navigatorKey.currentState!.context)
          .read(navigationBarProvider.notifier)
          .state = 2;
    }
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
