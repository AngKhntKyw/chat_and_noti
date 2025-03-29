import 'package:chat_and_noti/core/constant/screen_size.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const CommonElevatedButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(
          ScreenSize.getScreenSize(context).width,
          ScreenSize.getScreenSize(context).height / 15,
        ),
      ),
      child: Text(buttonName),
    );
  }
}
