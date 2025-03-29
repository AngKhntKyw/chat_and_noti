import 'package:flutter/widgets.dart';

class ScreenSize {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }
}
