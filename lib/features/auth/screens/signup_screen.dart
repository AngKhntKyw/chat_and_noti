import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_provider.dart';
import 'package:chat_and_noti/features/auth/widgets/common_elevated_button.dart';
import 'package:chat_and_noti/features/auth/widgets/common_text_form_field.dart';
import 'package:chat_and_noti/main.dart';
import 'package:chat_and_noti/navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerWidget {
  static const routeName = '/sign-up-screen';
  SignupScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp(WidgetRef ref) async {
    if (formKey.currentState!.validate()) {
      final userCredential = await ref
          .read(authRepositoryProvider)
          .signup(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            context: ref.context,
          );
      if (userCredential != null) {
        navigatorKey.currentState!.pushNamedAndRemoveUntil(
          NavigationBarScreen.routeName,
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              Text("Sign up"),

              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              CommonTextFormField(
                controller: nameController,
                hintText: "Name",
                maxLines: 1,
              ),

              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              CommonTextFormField(
                controller: emailController,
                hintText: "Email",
                maxLines: 1,
              ),

              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              CommonTextFormField(
                controller: passwordController,
                hintText: "Password",
                maxLines: 1,
              ),

              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              CommonElevatedButton(
                buttonName: 'Sign up',
                onPressed: () => signUp(ref),
              ),

              SizedBox(height: ScreenSize.getScreenSize(context).height / 40),

              TextButton(
                onPressed: () {
                  navigatorKey.currentState!.pop(context);
                },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
