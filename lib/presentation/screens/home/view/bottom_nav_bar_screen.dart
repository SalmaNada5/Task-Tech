import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/add_post/view/create_post_screen.dart';
import 'package:task_tech/presentation/screens/home/view/home_screen.dart';
import 'package:task_tech/presentation/screens/posts/view/posts_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:task_tech/presentation/screens/profile/view/profile_screen.dart';

import '../../chat_screens/view/chats_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatsScreen(),
    const AddPostScreen(),
    const PostsScreen(),
    const ProfileScreen(
      isMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
            ),
          ],
        ),
        child: CustomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 20,
          iconSize: 30,
          items: [
            CustomNavigationBarItem(
              selectedIcon: Image.asset('images/home_active.png'),
              icon: Image.asset('images/home_not_active.png'),
            ),
            CustomNavigationBarItem(
              selectedIcon: Image.asset('images/chats_active.png'),
              icon: Image.asset('images/chats_not_active.png'),
            ),
            CustomNavigationBarItem(
              selectedIcon: Image.asset('images/add_post_active.png'),
              icon: Image.asset('images/add_post_not_active.png'),
            ),
            CustomNavigationBarItem(
                selectedIcon: Image.asset('images/posts_active.png'),
                icon: Image.asset('images/posts_not_active.png')),
            CustomNavigationBarItem(
              selectedIcon: Image.asset('images/profile_active.png'),
              icon: Image.asset('images/profile_not_active.png'),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
