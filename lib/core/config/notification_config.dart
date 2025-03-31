import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:chat_and_noti/core/config/bubble_config.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversation_bubbles/conversation_bubbles.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final fireStore = FirebaseFirestore.instance;
final bubbles = BubblesService.instance;

void initNoti() async {
  final intentUri = await ConversationBubbles().getIntentUri();
  log("URL $intentUri");
  final token = await FirebaseMessaging.instance.getToken();
  log("Token $token");
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  if (await Permission.notification.status == PermissionStatus.denied) {
    await Permission.notification.request();
  }

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  log("Setting authorization status: ${settings.authorizationStatus}");
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    // on message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        // Extract data payload
        log("Noti ${message.data['key1']}");
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await fireStore.collection('users').doc(message.data['key1']).get();

        final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
        final userModel = UserModel.fromJson(userModelMap);

        // await showNoti(
        //   title: message.notification!.title ?? "",
        //   body: message.notification!.body ?? "",
        //   imageUrl: message.notification!.android!.imageUrl ?? "",
        // );

        await bubbles.show(
          userModel,
          message.notification!.body ?? "Body NULL",
          shouldAutoExpand: false,
        );
      }
    });

    // background message
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (message.notification != null) {
    // Extract data payload
    final String title = message.data['title'] ?? "";
    final String body = message.data['body'] ?? "";
    final String imageUrl = message.data['imageUrl'] ?? "";

    // bubbles.show(title: title, body: body, imageUrl: imageUrl);
    // await showNoti(title: title, body: body, imageUrl: imageUrl);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await fireStore.collection('users').doc(message.data['key1']).get();

    final userModelMap = documentSnapshot.data() as Map<String, dynamic>;
    final userModel = UserModel.fromJson(userModelMap);

    // await showNoti(
    //   title: message.notification!.title ?? "",
    //   body: message.notification!.body ?? "",
    //   imageUrl: message.notification!.android!.imageUrl ?? "",
    // );

    await bubbles.show(
      userModel,
      message.notification!.body ?? "Body NULL",
      shouldAutoExpand: false,
    );
  }
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
        'high_importance_channel',
        'High Importance Notifications',
        channelDescription: 'This channel is used for important notifications.',
        styleInformation: bigPictureStyleInformation,
        importance: Importance.high,
        priority: Priority.high,
        largeIcon: FilePathAndroidBitmap(localImagePath!),
        channelShowBadge: true,
        additionalFlags: Int32List.fromList(<int>[4]),
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
