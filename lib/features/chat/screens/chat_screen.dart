import 'package:chat_and_noti/core/config/bubble_config.dart';
import 'package:chat_and_noti/features/auth/model/user_model.dart';
import 'package:chat_and_noti/features/auth/widgets/common_text_form_field.dart';
import 'package:chat_and_noti/features/chat/model/message.dart';
import 'package:chat_and_noti/features/chat/repository/chat_repository_provider.dart';
import 'package:chat_and_noti/features/chat/widgets/message_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  final UserModel otherUser;
  static const routeName = '/chat-screen';

  ChatScreen({super.key, required this.otherUser});

  final formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  final bubbles = BubblesService.instance;

  void sendMessage(WidgetRef ref) {
    if (formKey.currentState!.validate()) {
      ref
          .read(chatRepositoryProvider)
          .sendMessage(
            message: Message(
              sender_id: FirebaseAuth.instance.currentUser!.uid,
              receiver_id: otherUser.user_id,
              message: messageController.text,
              created_at: DateTime.now(),
            ),
            otherUserId: otherUser.user_id,
            context: ref.context,
          );
      messageController.clear();
    }
  }

  Stream<List<Message>> getMessages(WidgetRef ref) {
    return ref
        .watch(chatRepositoryProvider)
        .getMessages(otherUserId: otherUser.user_id, context: ref.context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(otherUser.name),
        actions: [
          IconButton(
            onPressed: () {
              bubbles.show(
                title: '',
                body: '',
                imageUrl: '',
                otherUser: otherUser,
              );
            },
            icon: Icon(Icons.open_in_new),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: getMessages(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,

            reverse: true,
            itemBuilder: (context, index) {
              return MessageTile(message: snapshot.data![index]);
            },
          );
        },
      ),

      //
      bottomNavigationBar: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CommonTextFormField(
                    controller: messageController,
                    hintText: 'message...',
                  ),
                ),
                IconButton(
                  onPressed: () => sendMessage(ref),
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
