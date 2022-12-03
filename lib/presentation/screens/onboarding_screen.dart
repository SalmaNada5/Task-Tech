import 'package:flutter/material.dart';
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
        children: const [
          FirstOnBoarding(),
          SecondOnBoarding(),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: ExpandingDotsEffect(
              activeDotColor: primaryLightColor,
              dotColor: const Color(0xffD9D9D9),
              dotHeight: 10,
              dotWidth: 12,
            ),
          )
        ]),
      ),
    );
  }
}

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            onPressed: () {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
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
