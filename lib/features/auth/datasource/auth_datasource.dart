import 'package:chat_and_noti/core/constant/profile_image.dart';
import 'package:chat_and_noti/core/util/generate_date_time_int.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthDatasource {
  static final AuthDatasource _instance = AuthDatasource._();
  factory AuthDatasource() => _instance;
  AuthDatasource._();

  final fireAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireMessage = FirebaseMessaging.instance;
  final fireStorage = FirebaseStorage.instance;

  Future<UserCredential?> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential user = await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = await fireMessage.getToken();
      if (token != null && fireAuth.currentUser != null) {
        await fireStore
            .collection('users')
            .doc(fireAuth.currentUser!.uid)
            .update({"fcm_token": token});
      }

      return user;
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential user = await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await user.user!.updateDisplayName(name);
      String? fcmToken = await fireMessage.getToken();
      await user.user!.updatePhotoURL(defaultAvatar);

      final userModel = UserModel(
        user_id: fireAuth.currentUser!.uid,
        name: name,
        email: email,
        fcm_token: fcmToken!,
        profile_url: defaultAvatar,
        user_serial_number: generateDateTimeInt(),
      );

      await fireStore
          .collection("users")
          .doc(fireAuth.currentUser!.uid)
          .set(userModel.toJson());

      return user;
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  Future<void> logout({required BuildContext context}) async {
    try {
      await fireAuth.signOut();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Stream<UserModel> getUserById({required String userId}) {
    return fireStore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }
}
