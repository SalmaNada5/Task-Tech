import 'package:task_tech/utils/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    PostDetailsCubit postDetailsCubit =
        BlocProvider.of<PostDetailsCubit>(context, listen: false);
    homeCubit.initCubit();
    return RefreshIndicator(
      onRefresh: () => homeCubit.onRefresh(),
      child: Padding(
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
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color,
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
                      return SizedBox(
                        height: Constants.screenHeight * 0.2,
                        child: SingleChildScrollView(
                          controller: homeCubit.categoriesScrollController,
                          scrollDirection: Axis.horizontal,
                          child: ShimmerWidget(
                            enableShimmer: homeCubit.categoriesEnableShimmer,
                            child: Row(
                              children: homeCubit.categoriesEnableShimmer
                                  ? List.generate(
                                      6,
                                      (index) => const CategoryItem(
                                          imgUrl: '',
                                          catName: 'name',
                                          numOfSkills: 0))
                                  : [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: homeCubit.categories.length,
                                        itemBuilder: (ctx, i) => CategoryItem(
                                          catName: homeCubit.categories[i].name,
                                          imgUrl: homeCubit.categories[i].photo,
                                          numOfSkills:
                                              homeCubit.categories[i].nSkills,
                                        ),
                                      ),
                                      homeCubit.categoriesLoading
                                          ? const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
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
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    bloc: homeCubit,
                    builder: (context, state) {
                      return SizedBox(
                        height: 0.3 * Constants.screenHeight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: homeCubit.relatedPostsScrollController,
                          child: ShimmerWidget(
                            enableShimmer: homeCubit.relatedPostsEnableShimmer,
                            child: homeCubit.relatedPostsEnableShimmer
                                ? Row(
                                    children: List.generate(
                                      2,
                                      (index) => const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: RelatedPostItem(
                                            serviceImgUrl: '',
                                            profileImgUrl: '',
                                            userName: 'name',
                                            description: 'description',
                                            salary: 0,
                                            rate: 0),
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (ctx, i) => state
                                                    .userInfoModel
                                                    ?.data
                                                    ?.user
                                                    .id ==
                                                homeCubit.posts[i].user.id
                                            ? const SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RelatedPostItem(
                                                  onpressed: () async {
                                                    await postDetailsCubit
                                                        .getTaskDetailsFunction(
                                                            homeCubit
                                                                .posts[i].id);
                                                    Constants.navigateTo(
                                                        TaskDetailsPage(
                                                            postId: homeCubit
                                                                .posts[i].id));
                                                    return;
                                                  },
                                                  description: homeCubit
                                                      .posts[i].description,
                                                  profileImgUrl: homeCubit
                                                      .posts[i].user.photo,
                                                  rate: homeCubit.posts[i].user
                                                      .ratingsAverage,
                                                  salary:
                                                      homeCubit.posts[i].salary,
                                                  serviceImgUrl: homeCubit
                                                      .posts[i].attachFile,
                                                  userName: homeCubit
                                                      .posts[i].user.name,
                                                ),
                                              ),
                                        itemCount: homeCubit.posts.length,
                                      ),
                                      homeCubit.relatesPostsLoading
                                          ? const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
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
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    bloc: homeCubit,
                    builder: (context, state) {
                      return SizedBox(
                        height: Constants.screenHeight * 0.27,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: homeCubit.highestRatedScrollController,
                          child: ShimmerWidget(
                            enableShimmer: homeCubit.topUsersEnableShimmer,
                            child: Row(
                              children: homeCubit.topUsersEnableShimmer
                                  ? List.generate(
                                      3,
                                      (index) => const HighestRatedFreelancer(
                                          userImgUrl: '',
                                          userName: 'userName',
                                          job: 'job',
                                          rate: 0.0,
                                          onPress: null))
                                  : [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: homeCubit.users.length,
                                        itemBuilder: (ctx, i) {
                                          return state.userInfoModel?.data?.user
                                                      .id ==
                                                  homeCubit.users[i].id
                                              ? const SizedBox.shrink()
                                              : HighestRatedFreelancer(
                                                  userImgUrl:
                                                      homeCubit.users[i].photo,
                                                  userName:
                                                      homeCubit.users[i].name,
                                                  job: homeCubit.users[i].job,
                                                  rate: homeCubit
                                                      .users[i].ratingsAverage
                                                      .toDouble(),
                                                  onPress: () async {
                                                    await homeCubit
                                                        .getUserByIdFunc(
                                                            homeCubit
                                                                .users[i].id);
                                                    Constants.navigateTo(
                                                        const ProfileScreen(
                                                            isMe: false));
                                                  },
                                                );
                                        },
                                      ),
                                      homeCubit.topUserLoading
                                          ? const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                            ),
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
      ),
    );
  }
}
