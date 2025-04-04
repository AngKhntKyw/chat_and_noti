import 'dart:io';
import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:chat_and_noti/features/auth/widgets/common_text_form_field.dart';
import 'package:chat_and_noti/features/feed/datasource/feed_datasource.dart';
import 'package:chat_and_noti/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFeedScreen extends StatefulWidget {
  static const routeName = '/add-feed-screen';

  const AddFeedScreen({super.key});

  @override
  State<AddFeedScreen> createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
  final formKey = GlobalKey<FormState>();
  final feedTextController = TextEditingController();
  File? imageFile;

  void pickImage() async {
    XFile? pickedXFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedXFile != null) {
      setState(() {
        imageFile = File(pickedXFile.path);
      });
    }
  }

  void addFeed() async {
    if (formKey.currentState!.validate() && imageFile != null) {
      await FeedDatasource().addFeed(
        feedText: feedTextController.text,
        imageFile: imageFile,
        context: context,
      );
      navigatorKey.currentState!.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all fields"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Feed"),
        actions: [IconButton(onPressed: addFeed, icon: Icon(Icons.check))],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    CommonTextFormField(
                      controller: feedTextController,
                      hintText: 'Something .....',
                      maxLines: 8,
                    ),
                    SizedBox(
                      height: ScreenSize.getScreenSize(context).height / 40,
                    ),

                    if (imageFile != null)
                      InkWell(
                        onTap: pickImage,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            imageFile!,
                            width: ScreenSize.getScreenSize(context).width,
                            height: ScreenSize.getScreenSize(context).width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(onPressed: pickImage, icon: Icon(Icons.image)),
            ],
          ),
        ),
      ),
    );
  }
}
