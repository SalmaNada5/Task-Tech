import 'package:flutter/cupertino.dart';
import 'package:task_tech/presentation/screens/profile/view/about_me_page.dart';
import 'package:task_tech/utils/exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.isMe}) : super(key: key);
  final bool isMe;
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    bool isDarkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isMe
                  ? Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Constants.navigateTo(
                          const EditProfileScreen(),
                        ),
                        icon: Icon(
                          Icons.settings,
                          color: Theme.of(context).primaryColor,
                          size: 26,
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 40,
                    ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      foregroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: ClipOval(
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return CachedNetworkImage(
                              imageUrl: widget.isMe
                                  ? state.userInfoModel?.data?.user.photo ?? ''
                                  : homeCubit.userModel.data?.user.photo ?? '',
                              errorWidget: (context, url, error) {
                                return Image.asset(
                                  'images/placeholder.jpg',
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 50),
                      child: widget.isMe
                          ? GestureDetector(
                              onTap: () async {
                                await UploadProfilePhotoController
                                    .attachPhoto();
                                await UploadProfilePhotoController
                                    .uploadProfilePhotoFunc();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: const Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Text(
                      widget.isMe
                          ? state.userInfoModel?.data?.user.name ?? ''
                          : homeCubit.userModel.data?.user.name ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.headlineSmall!.color,
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return GradientText(
                        widget.isMe
                            ? state.userInfoModel?.data?.user.job ??
                                'freelancer'
                            : homeCubit.userModel.data?.user.job ??
                                'freelancer',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        colors: const [
                          Color.fromRGBO(22, 80, 105, 1),
                          Color.fromRGBO(184, 184, 184, 1),
                          Color.fromRGBO(22, 80, 105, 0.76),
                          Color.fromRGBO(124, 124, 124, 1),
                          Color.fromRGBO(22, 80, 105, 1)
                        ]);
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return SmoothStarRating(
                        rating: widget.isMe
                            ? state.userInfoModel?.data?.user.ratingsAverage!
                                    .toDouble() ??
                                0.0
                            : homeCubit.userModel.data?.user.ratingsAverage!
                                    .toDouble() ??
                                0.0,
                        size: 25,
                        filledIconData: Icons.star,
                        defaultIconData: Icons.star_border,
                        halfFilledIconData: Icons.star_half,
                        starCount: 5,
                        spacing: 2,
                        color: const Color.fromRGBO(255, 193, 7, 1),
                        borderColor: const Color.fromRGBO(218, 218, 218, 1),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return Text(
                        '${widget.isMe ? state.userInfoModel?.data?.user.ratingsAverage ?? 0 : homeCubit.userModel.data?.user.ratingsAverage ?? 0}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(218, 218, 218, 1)),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              !widget.isMe
                  ? Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color.fromRGBO(22, 80, 105, 1),
                                )),
                            child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'Message',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )),
                          ),
                          const Spacer(),
                          Container(
                            width: Constants.screenWidth * 0.4,
                            height: Constants.screenHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                profileCubit.isFollowed == false
                                    ? UserController.followUser(UserController
                                            .userModel.data?.user.id ??
                                        '')
                                    : UserController.unFollowUser(UserController
                                            .userModel.data?.user.id ??
                                        '');
                                profileCubit.followOrUnfollowFunction();
                              },
                              child: BlocBuilder<ProfileCubit, ProfileState>(
                                builder: (context, state) {
                                  return Text(
                                    profileCubit.isFollowed
                                        ? 'UnFollow'
                                        : 'Follow',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18, color: Colors.white),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 15,
              ),
              TabBar(
                padding: EdgeInsets.zero,
                tabs: [
                  Text(
                    'About me',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                  Text(
                    'Reviews',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                  Text(
                    'Portfolio',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ],
                indicatorColor: Theme.of(context).primaryColor,
                indicatorWeight: 5,
                labelPadding: const EdgeInsetsDirectional.only(bottom: 10),
                controller: _tabController,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    AboutmePage(
                      isMe: widget.isMe,
                    ),
                    ReviewPage(isMe: widget.isMe),
                    PortfolioPage(isMe: widget.isMe),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
