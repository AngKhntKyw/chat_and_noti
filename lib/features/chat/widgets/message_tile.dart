import 'package:chat_and_noti/features/chat/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  MessageTile({super.key, required this.message});

  final fireAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),

      alignment:
          message.sender_id == fireAuth.currentUser!.uid
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              message.sender_id == fireAuth.currentUser!.uid
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color:
                message.sender_id == fireAuth.currentUser!.uid
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
