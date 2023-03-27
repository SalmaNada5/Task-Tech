import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_tech/constants/colors.dart';

import '../widgets/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            isLastPage = value == 1;
          });
        },
        children: const [
          FirstOnBoarding(),
          SecondOnBoarding(),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                activeDotColor: primaryLightColor,
                dotColor: const Color(0xffD9D9D9),
                dotHeight: 10,
                dotWidth: 12,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(primaryLightColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)))),
                onPressed: isLastPage
                    ? () => Navigator.pushReplacementNamed(context, 'signUp')
                    : () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                child: isLastPage
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Get Started',
                            style: GoogleFonts.poppins(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      )
                    : const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 22,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            child: Text(
              'Skip',
              style: TextStyle(
                color: primaryLightColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, 'signUp'),
          ),
          SizedBox(
            height: screenH / 9,
          ),
          const OnboardingWidget(
              img: 'images/onboarding1.png',
              title: 'Search Your job',
              subtitle: 'We help you to find your job '
                  'based on your skillset and talent.'),
        ],
      ),
    );
  }
}

class SecondOnBoarding extends StatelessWidget {
  const SecondOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        OnboardingWidget(
            img: 'images/onboarding2.png',
            title: 'Browse Service List',
            subtitle:
                'Our service list include several fields, so you can find the best job for you.')
      ],
    );
  }
}
