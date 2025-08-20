import 'dart:developer';
import 'dart:io';
import 'package:chat_and_noti/core/config/route_helper.dart';
import 'package:chat_and_noti/main.dart';
import 'package:chat_and_noti/navigation_bar_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class LocalNotificationService {
  static final instance = LocalNotificationService._();
  LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: handleLocalNotification,
    );
  }

  Future<void> showNoti({
    required String title,
    required String body,
    required String imageUrl,
    required String payload,
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

    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'chat',
          'chat',
          channelDescription: 'chat',
          styleInformation: MediaStyleInformation(),
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          largeIcon: FilePathAndroidBitmap(localImagePath!),
          channelShowBadge: true,
          autoCancel: true,
          icon: '@mipmap/ic_launcher',
        );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch % 100000,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  void handleLocalNotification(NotificationResponse messageResponse) async {
    final currentRoute = navigatorKey.currentState?.getCurrentRoute();
    log('Current route name: ${currentRoute?.settings.name}');
    log('Current route arguments: ${currentRoute?.settings.arguments}');
    if (currentRoute?.settings.name == null) {
      ProviderScope.containerOf(navigatorKey.currentState!.context)
          .read(navigationBarProvider.notifier)
          .state = 2;
    } else {
      navigatorKey.currentState!.pop();
      ProviderScope.containerOf(navigatorKey.currentState!.context)
          .read(navigationBarProvider.notifier)
          .state = 2;
    }
  }
}
