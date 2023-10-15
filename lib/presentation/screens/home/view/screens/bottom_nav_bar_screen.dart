import 'package:flutter/cupertino.dart';

import 'package:task_tech/utils/exports.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
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
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      buildWhen: (previous, current) =>
          current is HomeInitial || current is NavBarIndexChangedState,
      builder: (context, state) {
        return Scaffold(
          body:
              IndexedStack(index: homeCubit.curentPageIndex, children: screens),
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
                      icon: const Icon(CupertinoIcons.house_fill,
                          size: 24, color: Colors.grey),
                      selectedIcon: Icon(
                        CupertinoIcons.house_fill,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      )),
                  CustomNavigationBarItem(
                      icon: const Icon(CupertinoIcons.chat_bubble_2,
                          size: 30, color: Colors.grey),
                      selectedIcon: Icon(
                        CupertinoIcons.chat_bubble_2,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      )),
                  CustomNavigationBarItem(
                    selectedIcon: Container(
                      alignment: Alignment.center,
                      width: 22,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
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
                currentIndex: homeCubit.curentPageIndex,
                onTap: (index) {
                  homeCubit.changeNavbarIndex(index);
                }),
          ),
        );
      },
    );
  }
}
