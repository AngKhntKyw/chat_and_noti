import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileDatasource {
  static final ProfileDatasource _instance = ProfileDatasource._();
  factory ProfileDatasource() => _instance;
  ProfileDatasource._();

  final fireAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireMessage = FirebaseMessaging.instance;
  final fireStorage = FirebaseStorage.instance;

  Stream<UserModel> getUserById({required String userId}) {
    return fireStore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }
}
