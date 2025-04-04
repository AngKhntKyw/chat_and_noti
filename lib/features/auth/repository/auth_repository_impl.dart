import 'package:chat_and_noti/features/auth/datasource/auth_datasource.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<UserCredential?> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    return await authDatasource.login(
      email: email,
      password: password,
      context: context,
    );
  }

  @override
  Future<void> logout({required BuildContext context}) async {
    await authDatasource.logout(context: context);
  }

  @override
  Future<UserCredential?> signup({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    return await authDatasource.signUpWithEmailPassword(
      name: name,
      email: email,
      password: password,
      context: context,
    );
  }

  @override
  Stream<UserModel> getUserById({required String userId}) {
    return authDatasource.getUserById(userId: userId);
  }
}
