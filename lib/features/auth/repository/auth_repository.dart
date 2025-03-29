import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<UserCredential?> login({
    required String email,
    required String password,
    required BuildContext context,
  });

  Future<UserCredential?> signup({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  });

  Future<void> logout({required BuildContext context});
}
