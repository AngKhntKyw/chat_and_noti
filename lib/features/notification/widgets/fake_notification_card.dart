import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FakeNotificationCard extends StatelessWidget {
  const FakeNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListTile(
        leading: CircleAvatar(),
        title: Text("------------------------"),
        subtitle: Text("---------------"),
      ),
    );
  }
}
