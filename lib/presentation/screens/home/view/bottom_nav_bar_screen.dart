import 'package:flutter/material.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/add_post/view/create_post_screen.dart';
import 'package:task_tech/presentation/screens/home/view/home_screen.dart';
import 'package:task_tech/presentation/screens/home/view/profile_page.dart';
import 'package:task_tech/presentation/screens/posts/view/posts_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

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
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: CustomNavigationBar(
        elevation: 20,
        iconSize: 30,
        selectedColor: primaryLightColor,
        unSelectedColor: const Color(0xffB1B1B1),
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
    );
  }
}
