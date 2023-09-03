import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/sign_up_screen.dart';

import '../../../widgets/onboarding.dart';

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
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: const Color(0xffD9D9D9),
                dotHeight: 10,
                dotWidth: 12,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)))),
                onPressed: isLastPage
                    ? () => Constants.navigateTo(const SignUpScreen(),
                        pushReplacment: true)
                    : () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                child: isLastPage
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Get Started',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
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
          const SizedBox(
            height: 10,
          ),
          TextButton(
            child: Text(
              'Skip',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () => Constants.navigateTo(const SignUpScreen(),pushReplacment: true)
          ),
          SizedBox(
            height: screenH / 12,
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
    return const Center(
      child: OnboardingWidget(
        img: 'images/onboarding2.png',
        title: 'Browse Service List',
        subtitle:
            'Our service list include several fields, so you can find the best job for you.',
      ),
    );
  }
}
