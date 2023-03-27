import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/add_post/create_post_screen.dart';
import 'package:task_tech/presentation/screens/chats_screen.dart';
import 'package:task_tech/presentation/screens/home/profile_screen.dart';
import 'package:task_tech/presentation/screens/posts/posts_screen.dart';
import 'package:task_tech/presentation/widgets/home_widgets/highest_rated_freelancer.dart';
import '../../widgets/home_widgets/category_item.dart';
import '../../widgets/home_widgets/service_widget.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String userName = 'salma nada';
  String url =
      'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  final screens = [
    const HomeScreen(),
    const ChatsScreen(),
    const AddPostScreen(),
    const PostsScreen(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _currentIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: 90,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back!',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: const Color(0xff7C7C7C),
                                  ),
                                ),
                                Text(
                                  userName,
                                  style: titleStyle.copyWith(fontSize: 24),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset('images/notifications.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            prefixIcon: Image.asset('images/search.png'),
                            suffixIcon: Image.asset('images/filter.png'),
                            hintText: 'what are you looking for?',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffC0C0C0),
                            ),
                            fillColor: const Color(0xffF5F5F5),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffB8B8B8)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffB8B8B8)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _searchController.text = value.toString();
                            _searchController.selection =
                                TextSelection.collapsed(
                                    offset: _searchController.text.length);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, 'categories'),
                          child: Row(
                            children: [
                              Text(
                                'Categories',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'All categories',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0xffB1B1B1),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                size: 14,
                                color: Color(0xffB1B1B1),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenH * .2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (ctx, n) => CategoryItem(
                              catName: 'Ui/UX Designer',
                              imgUrl: url,
                              numOfSkills: 1500,
                            ),
                          ),
                        ),
                        Text(
                          'Recently posts',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 0.3 * screenH,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (ctx, n) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ServicesItem(
                                description:
                                    'fkes tjhxhfgfuhioiu77u7hidrpfghpisghip',
                                numOfReviews: 170,
                                profileImgUrl: url,
                                rate: 5.4,
                                salary: 50,
                                serviceImgUrl: url,
                                userName: 'salma nada',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Highest rated freelancers',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 0.2 * screenH,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (ctx, n) => HighestRatedFreelancer(
                                  userImgUrl: url,
                                  userName: 'userName',
                                  job: 'job',
                                  rate: 4.9,
                                  onPress: () {})),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : screens[_currentIndex],
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
