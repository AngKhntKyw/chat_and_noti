import 'dart:convert';
import 'dart:developer';
import 'package:chat_and_noti/auth_gate.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_provider.dart';
import 'package:chat_and_noti/features/chat/repository/chat_repository_provider.dart';
import 'package:chat_and_noti/features/chat/widgets/user_model_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class HomeScreen extends ConsumerWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  void logout(WidgetRef ref) async {
    await ref.read(authRepositoryProvider).logout(context: ref.context);
    Navigator.pushNamedAndRemoveUntil(
      ref.context,
      AuthGate.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () => logout(ref),
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),

      body: StreamBuilder(
        stream: ref.read(chatRepositoryProvider).getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final userModel = snapshot.data![index];
              return UserModelListTile(userModel: userModel);
            },
          );
        },
      ),
    );
  }

  // Future<String> getAcessToken() async {
  //   final serviceAccountJson = {
  //     "type": dotenv.get('TYPE'),
  //     "project_id": dotenv.get('PROJECT_ID'),
  //     "private_key_id": dotenv.get('PRIVATE_KEY_ID'),
  //     "private_key": dotenv
  //         .get('PRIVATE_KEY')
  //         .replaceAll(r'\n', '\n')
  //         .replaceAll(' ', ''),
  //     "client_email": dotenv.get('CLIENT_EMAIL'),
  //     "client_id": dotenv.get('CLIENT_ID'),
  //     "auth_uri": dotenv.get('AUTH_URL'),
  //     "token_uri": dotenv.get('TOKEN_URL'),
  //     "auth_provider_x509_cert_url": dotenv.get('AUTH_PROVIDER_X509_CERT_URL'),
  //     "client_x509_cert_url": dotenv.get('CLIENT_PROVIDER_X509_CERT_URL'),
  //     "universe_domain": dotenv.get('UNIVERSE_DOMAIN'),
  //   };

  //   List<String> scopes = [
  //     "https://www.googleapis.com/auth/userinfo.email",
  //     "https://www.googleapis.com/auth/firebase.database",
  //     "https://www.googleapis.com/auth/firebase.messaging",
  //   ];

  //   http.Client client = await auth.clientViaServiceAccount(
  //     auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
  //     scopes,
  //   );

  //   auth.AccessCredentials credentials = await auth
  //       .obtainAccessCredentialsViaServiceAccount(
  //         auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
  //         scopes,
  //         client,
  //       );

  //   client.close();
  //   return credentials.accessToken.data;
  // }

  // void sendFirebaseMessage() async {
  //   String serverKey = await getAcessToken();

  //   String endPointFirebaseCloudMessaging = dotenv.get(
  //     'END_POINT_FIREBASE_CLOUD_MESSAGING',
  //   );

  //   final Map<String, dynamic> message = {
  //     'message': {
  //       'token':
  //           "fvK1nxhQSya0OjnwwSIVo7:APA91bF1apgPT_yxwzcHUMgw31F9okQjOzUtH2vXyQ1IeJL7x_vlQZhmzQDxURkas8Z42gjBzpuAnnu51JzFsQrDtO4yWpwO8vhu_TQY8OwORN07oLputjw",
  //       'notification': {
  //         'title': 'Hello from Flutter!',
  //         'body': 'This is a test message sent via FCM.',
  //         'image':
  //             'https://plus.unsplash.com/premium_photo-1670148434900-5f0af77ba500?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //       },
  //       'data': {
  //         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //         'message': 'Custom data payload',
  //       },
  //     },
  //   };

  //   final response = await http.post(
  //     Uri.parse(endPointFirebaseCloudMessaging),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $serverKey',
  //     },
  //     body: jsonEncode(message),
  //   );

  //   if (response.statusCode == 200) {
  //     log("FCM message sent successfully!");
  //   } else {
  //     log("Failed to send FCM message: ${response.body}");
  //   }
  // }
}
