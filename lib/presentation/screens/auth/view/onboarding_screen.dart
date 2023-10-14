import 'package:task_tech/utils/exports.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageView(
        controller: authCubit.onboardingPageController,
        onPageChanged: (value) {
          authCubit.onPageChanged(value);
        },
        children: const [
          FirstOnBoarding(),
          SecondOnBoarding(),
        ],
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: authCubit.onboardingPageController,
              count: 2,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: const Color(0xffD9D9D9),
                dotHeight: 10,
                dotWidth: 12,
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)))),
                    onPressed: authCubit.isLastPage
                        ? () => Constants.navigateTo(const SignUpScreen(),
                            pushReplacment: true)
                        : () => authCubit.onboardingPageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut),
                    child: authCubit.isLastPage
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
                          ));
              },
            )
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
              onPressed: () => Constants.navigateTo(const SignUpScreen(),
                  pushReplacment: true)),
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
