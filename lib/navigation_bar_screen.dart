import 'package:chat_and_noti/features/chat/screens/home_screen.dart';
import 'package:chat_and_noti/features/feed/screens/feed_screen.dart';
import 'package:chat_and_noti/features/notification/screens/notification_screen.dart';
import 'package:chat_and_noti/features/profile/screens/profile_screen.dart';
import 'package:chat_and_noti/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationBarScreen extends ConsumerWidget {
  static const routeName = '/navigation-bar-screen';

  NavigationBarScreen({super.key});

  final pages = [
    const HomeScreen(),
    const FeedScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: pages[ref.watch(navigationBarProvider)],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        onTap: (value) {
          ref.read(navigationBarProvider.notifier).state = value;
        },
        currentIndex: ref.watch(navigationBarProvider),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            activeIcon: Icon(Icons.feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
