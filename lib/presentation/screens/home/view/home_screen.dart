import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/shimmer_widget.dart';
import 'package:task_tech/presentation/screens/home/controller/get_user_controller.dart';
import 'package:task_tech/presentation/screens/home/controller/top_user_controller.dart';
import 'package:task_tech/presentation/screens/home/view/categories_screen.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';
import 'package:task_tech/presentation/screens/home/view/widgets/slivver_appbar.dart';
import 'package:task_tech/presentation/screens/posts_details/view/task_details.dart';
import 'package:task_tech/presentation/screens/profile/view/profile_screen.dart';
import 'package:task_tech/presentation/widgets/home_widgets/category_item.dart';
import 'package:task_tech/presentation/widgets/home_widgets/highest_rated_freelancer.dart';
import 'package:task_tech/presentation/widgets/home_widgets/home_search.dart';
import '../../../widgets/home_widgets/service_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.initCubit();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
      child: CustomScrollView(
        slivers: [
          const CustomSliverAppbar(),
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
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  builder: (context, state) {
                    return ShimmerWidget(
                      enableShimmer: homeCubit.categoriesEnableShimmer,
                      child: SizedBox(
                        height: Constants.screenHeight * 0.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeCubit.categories.length,
                          itemBuilder: (ctx, i) => CategoryItem(
                            catName: homeCubit.categories[i].name,
                            imgUrl: homeCubit.categories[i].photo,
                            numOfSkills: homeCubit.categories[i].nSkills,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  'Related posts',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  builder: (context, state) {
                    return ShimmerWidget(
                      enableShimmer: homeCubit.relatedPostsEnableShimmer,
                      child: SizedBox(
                        height: 0.3 * Constants.screenHeight,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (ctx, i) => homeCubit
                                      .userInfoModel.data?.user.id ==
                                  homeCubit.posts[i].user.id
                              ? const SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RelatedPostItem(
                                    onpressed: () {
                                      Constants.navigateTo(TaskDetailsPage(
                                          postId: homeCubit.posts[i].id));
                                      return;
                                    },
                                    description: homeCubit.posts[i].description,
                                    profileImgUrl:
                                        homeCubit.posts[i].user.photo,
                                    rate:
                                        homeCubit.posts[i].user.ratingsAverage,
                                    salary: homeCubit.posts[i].salary,
                                    serviceImgUrl:
                                        homeCubit.posts[i].attachFile,
                                    userName: homeCubit.posts[i].user.name,
                                  ),
                                ),
                          itemCount: homeCubit.posts.length,
                        ),
                      ),
                    );
                  },
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
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  builder: (context, state) {
                    return ShimmerWidget(
                      enableShimmer: homeCubit.topUsersEnableShimmer,
                      child: SizedBox(
                        height: Constants.screenHeight * 0.27,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: homeCubit.users.length,
                          itemBuilder: (ctx, i) {
                            return homeCubit.userInfoModel.data?.user.id ==
                                    homeCubit.users[i].id
                                ? const SizedBox.shrink()
                                : HighestRatedFreelancer(
                                    userImgUrl: homeCubit.users[i].photo,
                                    userName: homeCubit.users[i].name,
                                    job: homeCubit.users[i].job,
                                    rate: homeCubit.users[i].ratingsAverage
                                        .toDouble(),
                                    onPress: () async {
                                      await UserController.getUserByIdFunc(
                                          TopUserController.users[i].id);
                                      Constants.navigateTo(
                                          const ProfileScreen(isMe: false));
                                    },
                                  );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
