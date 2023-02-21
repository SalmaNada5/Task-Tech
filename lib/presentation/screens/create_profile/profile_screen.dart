import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/create_profile/portfolioPage.dart';
import 'package:task_tech/presentation/screens/create_profile/reviewPage.dart';

import 'aboutmePage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  var rating = 0.0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
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
                  padding: EdgeInsetsDirectional.only(
                      start: 15, end: 15, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage('images/picture.png'),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Text(
                        'Eman Elsayed',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GradientText('UI/UX Designer',
                          style: TextStyle(
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
                      SizedBox(
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
                            color: Color.fromRGBO(255, 193, 7, 1),
                            borderColor: Color.fromRGBO(218, 218, 218, 1),
                            onRatingChanged: (value) {
                              setState(() {
                                rating = value;
                                print(rating);
                              });
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$rating',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(218, 218, 218, 1)),
                          )
                        ],
                      ),
                      SizedBox(
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
                                  color: Color.fromRGBO(22, 80, 105, 1),
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
                          SizedBox(width: 30),
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
                      SizedBox(
                        height: 30,
                      ),
                      TabBar(
                        tabs: [
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
                        indicatorColor: Color.fromRGBO(22, 80, 105, 1),
                        indicatorWeight: 5,
                        labelPadding: EdgeInsetsDirectional.only(bottom: 10),
                        controller: _tabController,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
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
