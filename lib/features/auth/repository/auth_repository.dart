import 'package:chat_and_noti/features/auth/model/user_model.dart';
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
  Stream<UserModel> getUserById({required String userId});
}
