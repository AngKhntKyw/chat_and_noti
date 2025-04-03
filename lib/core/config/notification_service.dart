import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:chat_and_noti/core/config/bubble_service.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/screens/chat_screen.dart';
import 'package:chat_and_noti/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class NotificationService {
  static final instance = NotificationService._();
  NotificationService._();

  final fireMessage = FirebaseMessaging.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireAuth = FirebaseAuth.instance;

  final bubbles = BubblesService.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
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
            await fireStore.collection('users').doc(message.data['key1']).get();
        final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
        final userModel = UserModel.fromJson(userModelMap);
        bubbles.show(userModel, message.notification!.body ?? "BODY NULL");
      }
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  Future<void> showNoti({
    required String title,
    required String body,
    required String imageUrl,
  }) async {
    String? localImagePath;
    if (imageUrl.isNotEmpty) {
      try {
        final http.Response response = await http.get(Uri.parse(imageUrl));
        final Directory directory = await getApplicationDocumentsDirectory();
        final File file = File('${directory.path}/notification_image.jpg');
        await file.writeAsBytes(response.bodyBytes);

        localImagePath = file.path;
      } catch (e) {
        log('Error downloading noti image: $e');
      }
    }

    final BigPictureStyleInformation bigPictureStyleInformation =
        localImagePath != null
            ? BigPictureStyleInformation(
              FilePathAndroidBitmap(localImagePath),
              contentTitle: title,
              summaryText: body,
              hideExpandedLargeIcon: false,
            )
            : BigPictureStyleInformation(
              const DrawableResourceAndroidBitmap('app_icon'),
              contentTitle: title,
              summaryText: body,
              hideExpandedLargeIcon: false,
            );

    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'chat',
          'chat',
          channelDescription:
              'This channel is used for important notifications.',
          styleInformation: MediaStyleInformation(),
          importance: Importance.high,
          priority: Priority.defaultPriority,
          largeIcon: FilePathAndroidBitmap(localImagePath!),
          channelShowBadge: true,
          autoCancel: true,
          additionalFlags: Int32List.fromList(<int>[4]),
          actions: <AndroidNotificationAction>[
            AndroidNotificationAction('id_1', 'Action 1',allowGeneratedReplies: true),
            AndroidNotificationAction('id_2', 'Action 2'),
          ],
        );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  void handle(RemoteMessage initialMessage) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await fireStore
            .collection('users')
            .doc(initialMessage.data['key1'])
            .get();
    final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
    final userModel = UserModel.fromJson(userModelMap);
    navigatorKey.currentState!.pushNamed(
      ChatScreen.routeName,
      arguments: userModel,
    );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final fireStore = FirebaseFirestore.instance;

  //

  DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      await fireStore.collection('users').doc(message.data['key1']).get();
  final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
  final userModel = UserModel.fromJson(userModelMap);
  NotificationService.instance.showNoti(
    title: message.notification!.title ?? "TITLE NULL",
    body: message.notification!.body ?? "BODY NULL",
    imageUrl: userModel.profile_url,
  );
}
