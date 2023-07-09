import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/controller/cur_user_controller.dart';
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
    try {
      await CurrentUserInfoController.getUserInfoFunc();
      setState(() {});
    } catch (e) {
      logError('$e in getProfileInfo');
    }
  }

  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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
                child: CircleAvatar(
                  radius: 50,
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
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  CurrentUserInfoController.userInfoModel.data?.user.name ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: GradientText(
                    CurrentUserInfoController.userInfoModel.data?.user.job ??
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
                    rating: CurrentUserInfoController
                            .userInfoModel.data?.user.ratingsAverage
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
                    '${CurrentUserInfoController.userInfoModel.data?.user.ratingsAverage ?? 0}',
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
                          color: white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: primaryLightColor,
                          )),
                      child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Message',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color.fromRGBO(22, 80, 105, 1)),
                          )),
                    ),
                    const Spacer(),
                    Container(
                      width: Constants.screenWidth * 0.4,
                      height: Constants.screenHeight * 0.05,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(22, 80, 105, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: MaterialButton(
                          onPressed: () {
                            widget.isMe
                                ? Constants.navigateTo(
                                    const EditProfileScreen())
                                : isFollowed == false
                                    ? CurrentUserInfoController.followUser(
                                        CurrentUserInfoController
                                                .userInfoModel.data?.user.id ??
                                            '')
                                    : CurrentUserInfoController.unFollowUser(
                                        CurrentUserInfoController
                                                .userInfoModel.data?.user.id ??
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
                        color: Colors.black),
                  ),
                  Text(
                    'Reviews',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    'Portfolio',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
                indicatorColor: primaryLightColor,
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
                  children: const [
                    AboutmePage(),
                    ReviewPage(),
                    PortfolioPage()
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
