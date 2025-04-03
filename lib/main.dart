import 'dart:developer';
import 'package:chat_and_noti/auth_gate.dart';
import 'package:chat_and_noti/core/config/bubble_service.dart';
import 'package:chat_and_noti/core/config/notification_service.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/screens/chat_screen.dart';
import 'package:chat_and_noti/features/chat/screens/home_screen.dart';
import 'package:chat_and_noti/features/auth/screens/signup_screen.dart';
import 'package:chat_and_noti/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await BubblesService.instance.init();
  await NotificationService.instance.init();

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
        if (settings.name == AuthGate.routeName) {
          return MaterialPageRoute(
            builder: (_) => const AuthGate(),
            settings: settings,
          );
        } else if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => HomeScreen(),
            settings: settings,
          );
        } else if (settings.name == SignupScreen.routeName) {
          return MaterialPageRoute(
            builder: (_) => SignupScreen(),
            settings: settings,
          );
        } else if (settings.name == ChatScreen.routeName) {
          final otherUser = settings.arguments as UserModel;
          return MaterialPageRoute(
            builder: (_) => ChatScreen(otherUser: otherUser),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
