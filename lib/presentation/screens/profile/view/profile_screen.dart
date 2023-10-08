import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/controller/cur_user_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/upload_profile_photo_controller.dart';
import 'package:task_tech/presentation/screens/home/controller/get_user_controller.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';
import 'package:task_tech/presentation/screens/profile/view/edit_profile_screen.dart';
import 'package:task_tech/presentation/screens/profile/view/portfolio_page.dart';
import 'package:task_tech/presentation/screens/profile/view/review_page.dart';

import 'about_me_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.isMe}) : super(key: key);
  final bool isMe;
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  num? rating;
  TabController? _tabController;

  @override
  void initState() {
    getProfileInfo();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  void getProfileInfo() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        Constants.showLoading();
        await CurrentUserInfoController.getUserInfoFunc();
        try {
          String? id = CurrentUserInfoController
              .userInfoModel.data?.user.followings!
              .firstWhere((element) =>
                  element.toString() == UserController.userModel.data?.user.id);

          if (id != null) {
            isFollowed = true;
          }
        } catch (e) {
          isFollowed = false;
          logError('$e');
        }
        Constants.hideLoadingOrNavBack();
        setState(() {});
      } catch (e) {
        logError('$e in getProfileInfo');
      }
    });
  }

  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          buildWhen: (p, c) =>
              c is HomeInitial ||
              c is GetSpecificUserSucces ||
              c is GetUserInfoSucces,
          builder: (context, state) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.of(context).size.width * 0.03,
                  end: MediaQuery.of(context).size.width * 0.03,
                  bottom: MediaQuery.of(context).size.height * 0.03,
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
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
                            child: CachedNetworkImage(
                              imageUrl: widget.isMe
                                  ? state.userInfoModel?.data?.user.photo ?? ''
                                  : homeCubit.userModel.data?.user.photo ?? '',
                              errorWidget: (context, url, error) {
                                return Image.asset(
                                  'images/placeholder.jpg',
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
                                    final result =
                                        await UploadProfilePhotoController
                                            .attachPhoto();
                                    await UploadProfilePhotoController
                                        .uploadProfilePhotoFunc();
                                    if (result != null) {
                                      // setState(() {
                                      //   imagefile = File(result.files.single.path!);
                                      // });
                                    }
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
                    child: Text(
                      widget.isMe
                          ? state.userInfoModel?.data?.user.name ?? ''
                          : homeCubit.userModel.data?.user.name ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.headlineSmall!.color,
                      ),
                    ),
                  ),
                  Center(
                    child: GradientText(
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
                        ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothStarRating(
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
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.isMe ? state.userInfoModel?.data?.user.ratingsAverage ?? 0 : homeCubit.userModel.data?.user.ratingsAverage ?? 0}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(218, 218, 218, 1)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: MediaQuery.of(context).size.width * 0.03,
                        end: MediaQuery.of(context).size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Constants.isDarkMode
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
                                widget.isMe
                                    ? Constants.navigateTo(
                                        const EditProfileScreen())
                                    : isFollowed == false
                                        ? UserController.followUser(
                                            UserController
                                                    .userModel.data?.user.id ??
                                                '')
                                        : UserController.unFollowUser(
                                            UserController
                                                    .userModel.data?.user.id ??
                                                '');
                                setState(() {
                                  isFollowed = !isFollowed;
                                });
                              },
                              child: Text(
                                widget.isMe
                                    ? 'Setting'
                                    : isFollowed
                                        ? 'UnFollow'
                                        : 'Follow',
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TabBar(
                    tabs: [
                      Text(
                        'About me',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Constants.isDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                      Text(
                        'Reviews',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Constants.isDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                      Text(
                        'Portfolio',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Constants.isDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                    ],
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorWeight: 5,
                    labelPadding: const EdgeInsetsDirectional.only(bottom: 10),
                    controller: _tabController,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // ignore: prefer_const_constructors
                        AboutmePage( isMe:widget.isMe,),
                        ReviewPage(isMe: widget.isMe),
                        PortfolioPage(isMe: widget.isMe),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
