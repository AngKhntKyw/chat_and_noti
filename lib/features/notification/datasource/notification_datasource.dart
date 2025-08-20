import 'package:chat_and_noti/core/util/send_firebase_message.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/chat/model/message.dart';
import 'package:chat_and_noti/features/notification/model/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, SnackBar, Text;

class NotificationDatasource {
  static final NotificationDatasource _instance = NotificationDatasource._();
  factory NotificationDatasource() => _instance;
  NotificationDatasource._();

  final fireAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireMessage = FirebaseMessaging.instance;

  Future<void> addNotification({
    required String notiText,
    required String feedId,
    required BuildContext context,
  }) async {
    try {
      List<UserModel> userList = await fireStore
          .collection('users')
          .where('user_id', isNotEqualTo: fireAuth.currentUser!.uid)
          .get()
          .then((value) {
            return value.docs.map((doc) {
              return UserModel.fromJson(doc.data());
            }).toList();
          });

      for (UserModel user in userList) {
        DocumentReference docRef =
            fireStore
                .collection('users')
                .doc(user.user_id)
                .collection('notifications')
                .doc();

        final notification = Notification(
          notification_id: docRef.id,
          feed_id: feedId,
          notiText: notiText,
          is_read: false,
          created_at: DateTime.now(),
          notification_owner_id: fireAuth.currentUser!.uid,
        );

        await fireStore
            .collection('users')
            .doc(user.user_id)
            .collection('notifications')
            .doc(docRef.id)
            .set(notification.toJson());

        Message message = Message(
          sender_id: fireAuth.currentUser!.uid,
          receiver_id: user.user_id,
          message: notiText,
          created_at: DateTime.now(),
        );

        sendFirebaseMessage(user.fcm_token, message, "feed");
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Stream<List<Notification>> getAllNotifications() {
    return fireStore
        .collection('users')
        .doc(fireAuth.currentUser!.uid)
        .collection('notifications')
        .orderBy('created_at', descending: true)
        .snapshots(includeMetadataChanges: false)
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return Notification.fromJson(doc.data());
          }).toList();
        });
  }

  Future<void> readNotification({required String notificationId}) async {
    await fireStore
        .collection('users')
        .doc(fireAuth.currentUser!.uid)
        .collection('notifications')
        .doc(notificationId)
        .update({"is_read": true});
  }
}
