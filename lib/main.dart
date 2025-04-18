import 'dart:developer';
import 'package:chat_and_noti/auth_gate.dart';
import 'package:chat_and_noti/core/config/bubble_service.dart';
import 'package:chat_and_noti/core/config/local_notification_service.dart';
import 'package:chat_and_noti/core/config/notification_service.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/screens/chat_screen.dart';
import 'package:chat_and_noti/features/chat/screens/home_screen.dart';
import 'package:chat_and_noti/features/auth/screens/signup_screen.dart';
import 'package:chat_and_noti/features/feed/screens/add_feed_screen.dart';
import 'package:chat_and_noti/features/feed/screens/feed_detail_screen.dart';
import 'package:chat_and_noti/features/feed/screens/feed_screen.dart';
import 'package:chat_and_noti/features/notification/screens/notification_screen.dart';
import 'package:chat_and_noti/features/profile/screens/profile_screen.dart';
import 'package:chat_and_noti/firebase_options.dart';
import 'package:chat_and_noti/navigation_bar_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await BubblesService.instance.init();
  await LocalNotificationService.instance.init();
  await NotificationService.instance.init();
  FlutterNativeSplash.remove();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bubbles = BubblesService.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat & Noti",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      navigatorKey: navigatorKey,

      //
      initialRoute: AuthGate.routeName,

      //
      onGenerateInitialRoutes: (route) {
        log("InitialRoute $route");
        return [
          if (!bubbles.isInBubble)
            MaterialPageRoute(builder: (_) => const AuthGate()),
          if (bubbles.launchUserModel != null)
            MaterialPageRoute(
              builder: (_) => ChatScreen(otherUser: bubbles.launchUserModel!),
            ),
        ];
      },

      //
      onGenerateRoute: (settings) {
        // auth gate
        if (settings.name == AuthGate.routeName) {
          return MaterialPageRoute(
            builder: (_) => const AuthGate(),
            settings: settings,
          );
        } else if (settings.name == SignupScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => SignupScreen(),
            settings: settings,
          );
        }
        // navigation bar screen
        else if (settings.name == NavigationBarScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => NavigationBarScreen(),
            settings: settings,
          );
        }
        // chat
        else if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => HomeScreen(),
            settings: settings,
          );
        } else if (settings.name == ChatScreen.routeName) {
          final otherUser = settings.arguments as UserModel;
          return MaterialPageRoute(
            builder: (_) => ChatScreen(otherUser: otherUser),
            settings: settings,
          );
        }
        // feed
        else if (settings.name == FeedScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => FeedScreen(),
            settings: settings,
          );
        } else if (settings.name == AddFeedScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => AddFeedScreen(),
            settings: settings,
          );
        } else if (settings.name == FeedDetailScreen.routeName) {
          final feedId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => FeedDetailScreen(feedId: feedId),
            settings: settings,
          );
        }
        // notification
        else if (settings.name == NotificationScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => NotificationScreen(),
            settings: settings,
          );
        }
        // profile
        else if (settings.name == ProfileScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => ProfileScreen(),
            settings: settings,
          );
        }

        return null;
      },
    );
  }
}
