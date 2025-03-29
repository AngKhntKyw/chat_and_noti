import 'package:chat_and_noti/auth_gate.dart';
import 'package:chat_and_noti/core/config/notification_config.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/screens/chat_screen.dart';
import 'package:chat_and_noti/features/chat/screens/home_screen.dart';
import 'package:chat_and_noti/features/auth/screens/signup_screen.dart';
import 'package:chat_and_noti/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initNoti();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat & Noti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      onGenerateInitialRoutes: (_) {
        return [MaterialPageRoute(builder: (_) => const AuthGate())];
      },
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
