import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/controller/cur_user_controller.dart';
import 'package:task_tech/presentation/screens/home/controller/category_controller.dart';
import 'package:task_tech/presentation/screens/home/controller/related_posts_controller.dart';
import 'package:task_tech/presentation/screens/home/controller/top_user_controller.dart';
import 'package:task_tech/presentation/screens/home/view/categories_screen.dart';
import 'package:task_tech/presentation/screens/home/view/notifications_screen.dart';
import 'package:task_tech/presentation/widgets/home_widgets/category_item.dart';
import 'package:task_tech/presentation/widgets/home_widgets/highest_rated_freelancer.dart';
import 'package:task_tech/presentation/widgets/home_widgets/home_search.dart';
import 'package:task_tech/presentation/widgets/home_widgets/service_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    highestRatedScrollController();
    categoriesScrollController();
    relatedPostsScrollController();
    getAllTopUsers();
    getPopularCateogries();
    getRelatedPosts();
    super.initState();
  }

  void getAllTopUsers() async {
    try {
      await TopUserController.getTopUsersFunc();
      setState(() {});
    } catch (e) {
      logError('$e in getAllTopUsers');
    }
  }

  void getPopularCateogries() async {
    try {
      await CategoryController.getPopularCategoriesFunc();
      setState(() {});
    } catch (e) {
      logError('$e in getPopularCategoriesFunc');
    }
  }

  void getRelatedPosts() async {
    try {
      await RelatedPostscontroller.getRelatedPostsFunc();
      setState(() {});
    } catch (e) {
      logError('$e in getRelatedPosts');
    }
  }

  bool isCatLoading = false;
  bool isLoading = false;
  bool relatedPostsLoading = false;
  bool photoReturned = false;

  void highestRatedScrollController() async {
    TopUserController.highestRatedScrollController.addListener(() async {
      if (TopUserController.highestRatedScrollController.position.atEdge &&
          TopUserController.highestRatedScrollController.position.pixels != 0) {
        if (TopUserController.page >
            (TopUserController.topUserModel.paginationResult?.numberOfPages ??
                1)) {
          return;
        }
        if (isLoading) {
          return;
        }
        setState(() {
          isLoading = true;
        });
        await TopUserController.getTopUsersFunc(dioLoading: false);
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  void categoriesScrollController() async {
    CategoryController.scrollController.addListener(() async {
      if (CategoryController.scrollController.position.atEdge &&
          CategoryController.scrollController.position.pixels != 0) {
        if (CategoryController.page >
            (CategoryController.categoryModel.paginationResult?.numberOfPages ??
                1)) {
          return;
        }
        if (isCatLoading) {
          return;
        }
        setState(() {
          isCatLoading = true;
        });
        await CategoryController.getPopularCategoriesFunc(dioLoading: false);
        setState(() {
          isCatLoading = false;
        });
      }
    });
  }

  void relatedPostsScrollController() async {
    RelatedPostscontroller.scrollController.addListener(() async {
      if (RelatedPostscontroller.scrollController.position.atEdge &&
          RelatedPostscontroller.scrollController.position.pixels != 0) {
        if (RelatedPostscontroller.page >
            (RelatedPostscontroller
                    .relatedPostModel.paginationResult?.numberOfPages ??
                1)) {
          return;
        }
        if (relatedPostsLoading) {
          return;
        }
        setState(() {
          relatedPostsLoading = true;
        });
        await RelatedPostscontroller.getRelatedPostsFunc(dioLoading: false);
        setState(() {
          relatedPostsLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentUserInfoController.getUserInfoFunc();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 70,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: CurrentUserInfoController
                                  .userInfoModel.data?.user.photo ??
                              '',
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              'images/placeholder.jpg',
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back!',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: const Color(0xff7C7C7C),
                          ),
                        ),
                        Text(
                          CurrentUserInfoController
                                  .userInfoModel.data?.user.name ??
                              '',
                          style: titleStyle.copyWith(fontSize: 22),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Constants.navigateTo(const NotificationsScreen());
                      },
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
                const SearchWidget(),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Constants.navigateTo(const CategoriesScreen()),
                  child: Row(
                    children: [
                      Text(
                        'Popular Categories',
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
                  height: Constants.screenHeight * 0.2,
                  child: SingleChildScrollView(
                    controller: CategoryController.scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: CategoryController.categories.length,
                          itemBuilder: (ctx, i) => CategoryItem(
                            catName: CategoryController.categories[i].name,
                            imgUrl: CategoryController.categories[i].photo,
                            numOfSkills:
                                CategoryController.categories[i].nSkills,
                          ),
                        ),
                        isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: CircularProgressIndicator(),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Related posts',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 0.3 * Constants.screenHeight,
                  child: SingleChildScrollView(
                    controller: RelatedPostscontroller.scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ServicesItem(
                              description: RelatedPostscontroller
                                  .relatedPostModel.data!.posts[i].description,
                              profileImgUrl: RelatedPostscontroller
                                  .relatedPostModel.data!.posts[i].user.photo,
                              rate: RelatedPostscontroller.relatedPostModel
                                  .data!.posts[i].user.ratingsAverage,
                              salary: RelatedPostscontroller
                                      .relatedPostModel.data?.posts[i].salary ??
                                  0,
                              serviceImgUrl:
                                  RelatedPostscontroller.posts[i].attachFile,
                              userName: RelatedPostscontroller
                                  .relatedPostModel.data!.posts[i].user.name,
                            ),
                          ),
                          itemCount: RelatedPostscontroller
                                  .relatedPostModel.data?.posts.length ??
                              0,
                        ),
                      ],
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
                  height: Constants.screenHeight * 0.27,
                  child: SingleChildScrollView(
                    controller: TopUserController.highestRatedScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: TopUserController.users.length,
                          itemBuilder: (ctx, i) {
                            return HighestRatedFreelancer(
                              userImgUrl: TopUserController.users[i].photo,
                              userName: TopUserController.users[i].name,
                              job: TopUserController.users[i].job,
                              rate: TopUserController.users[i].ratingsAverage
                                  .toDouble(),
                              onPress: () {},
                            );
                          },
                        ),
                        isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: CircularProgressIndicator(),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
