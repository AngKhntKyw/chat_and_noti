import 'package:flutter/material.dart';

extension NavigatorStateExtension on NavigatorState {
  Route<dynamic>? getCurrentRoute() {
    Route<dynamic>? currentRoute;
    popUntil((route) {
      currentRoute = route;
      return true;
    });
    return currentRoute;
  }
}
