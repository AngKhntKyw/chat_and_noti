import 'package:chat_and_noti/features/auth/screens/login_screen.dart';
import 'package:chat_and_noti/navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  static const routeName = '/auth-gate';

  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final fireAuth = FirebaseAuth.instance;
    return fireAuth.currentUser == null ? LoginScreen() : NavigationBarScreen();
  }
}
