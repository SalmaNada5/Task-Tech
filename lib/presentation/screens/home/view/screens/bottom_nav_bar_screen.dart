import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/add_post/view/create_post_screen.dart';
import 'package:task_tech/presentation/screens/chat_screens/view/chats_screen.dart';
import 'package:task_tech/presentation/screens/home/view/screens/home_screen.dart';
import 'package:task_tech/presentation/screens/posts/view/posts_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:task_tech/presentation/screens/profile/view/profile_screen.dart';

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
              blurRadius: 4,
            ),
          ],
        ),
        child: CustomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 20,
          items: [
            CustomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home,
                    size: 24, color: Colors.grey),
                selectedIcon: Icon(
                  CupertinoIcons.home,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                )),
            CustomNavigationBarItem(
                icon: const Icon(CupertinoIcons.chat_bubble_text,
                    size: 26, color: Colors.grey),
                selectedIcon: Icon(
                  CupertinoIcons.chat_bubble_text,
                  size: 26,
                  color: Theme.of(context).primaryColor,
                )),
            CustomNavigationBarItem(
              selectedIcon: Container(
                alignment: Alignment.center,
                width: 22,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Icon(Icons.add,
                    size: 14, color: Theme.of(context).primaryColor),
              ),
              icon: Container(
                alignment: Alignment.center,
                width: 22,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Icon(
                  Icons.add,
                  size: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            CustomNavigationBarItem(
                icon: const Icon(CupertinoIcons.doc_on_doc,
                    size: 24, color: Colors.grey),
                selectedIcon: Icon(
                  CupertinoIcons.doc_on_doc,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                )),
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.person_crop_circle,
                  size: 28, color: Colors.grey),
              selectedIcon: Icon(
                CupertinoIcons.person_crop_circle,
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
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
