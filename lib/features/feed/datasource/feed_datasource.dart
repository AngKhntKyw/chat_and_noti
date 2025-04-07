import 'package:chat_and_noti/core/util/upload_image_to_firestorage.dart';
import 'package:chat_and_noti/features/feed/model/feed.dart';
import 'package:chat_and_noti/features/notification/repository/notification_repository_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class FeedDatasource {
  static final FeedDatasource _instance = FeedDatasource._();
  factory FeedDatasource() => _instance;
  FeedDatasource._();

  final fireAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireMessage = FirebaseMessaging.instance;
  final fireStorage = FirebaseStorage.instance;

  Stream<List<Feed>> getAllFeeds() {
    return fireStore
        .collection('feeds')
        .orderBy('created_at', descending: true)
        .snapshots(includeMetadataChanges: false)
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return Feed.fromJson(doc.data());
          }).toList();
        });
  }

  Stream<Feed> getFeedById({required String feedId}) {
    return fireStore.collection('feeds').doc(feedId).snapshots().map((
      snapshot,
    ) {
      return Feed.fromJson(snapshot.data()!);
    });
  }

  Future<void> addFeed({
    required String feedText,
    required imageFile,
    required WidgetRef ref,
  }) async {
    try {
      final id = const Uuid().v1();
      await uploadImageToFireStorage(
        imageFile: imageFile,
        ref: "feedImages/${fireAuth.currentUser!.uid}/$id",
        firebaseStorage: fireStorage,
      ).then((value) async {
        // Feed
        DocumentReference docRef = fireStore.collection('feeds').doc();
        Feed feed = Feed(
          id: docRef.id,
          feed_text: feedText,
          feed_owner_id: fireAuth.currentUser!.uid,
          image: value,
          created_at: DateTime.now(),
        );

        await docRef.set(feed.toJson());
        ref
            .read(notificationRepositoryProvider)
            .addNotification(
              notiText: feedText,
              context: ref.context,
              feedId: docRef.id,
            );
      });
    } catch (e) {
      ScaffoldMessenger.of(
        ref.context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
