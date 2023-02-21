import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/create_profile/portfolio_page.dart';
import 'package:task_tech/presentation/screens/create_profile/review_page.dart';

import 'about_me_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  var rating = 0.0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: white,
              elevation: 0,
              leading: IconButton(
                icon: Image.asset('icons/bi_arrow-left-circle-fill.png'),
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Center(
              child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 15, end: 15, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage('images/picture.png'),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      const Text(
                        'Eman Elsayed',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GradientText('UI/UX Designer',
                          style: const TextStyle(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothStarRating(
                            rating: rating,
                            size: 25,
                            filledIconData: Icons.star,
                            defaultIconData: Icons.star_border,
                            halfFilledIconData: Icons.star_half,
                            starCount: 5,
                            spacing: 2,
                            color: const Color.fromRGBO(255, 193, 7, 1),
                            borderColor: const Color.fromRGBO(218, 218, 218, 1),
                            onRatingChanged: (value) {
                              setState(() {
                                rating = value;
                                debugPrint(rating.toString());
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$rating',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(218, 218, 218, 1)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 160,
                            height: 50,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: primaryLightColor,
                                )),
                            child: MaterialButton(
                                onPressed: () {},
                                child: const Text(
                                  'Message',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(22, 80, 105, 1)),
                                )),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            width: 160,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(22, 80, 105, 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: MaterialButton(
                                onPressed: () {},
                                child: const Text(
                                  'Hire Me',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TabBar(
                        tabs: const [
                          Text(
                            'About me',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            'Reviews',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            'Portfolio',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                        indicatorColor: primaryLightColor,
                        indicatorWeight: 5,
                        labelPadding:
                            const EdgeInsetsDirectional.only(bottom: 10),
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
                            //Test()
                            PortfolioPage()
                          ],
                        ),
                      )
                    ],
                  )),
            )));
  }
}
