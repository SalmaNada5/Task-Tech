import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/onboarding_screen.dart';
import 'package:task_tech/presentation/screens/home/view/screens/bottom_nav_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    _navigateToHomeOrOnboardingScreen();
    initAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? const Color(0xff165069) : const Color(0xff1B2936),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/Logo.png'),
            AnimatedBuilder(
                animation: animation,
                builder: (context, _) {
                  return SlideTransition(
                    position: animation,
                    child: Text(
                      'TASK-TECH',
                      style: GoogleFonts.redRose(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          shadows: [
                            Shadow(
                                color: Colors.white.withOpacity(0.15),
                                offset: const Offset(3, 4))
                          ]),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  _navigateToHomeOrOnboardingScreen() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Constants.navigateTo(
      token == null ? const OnboardingScreen() : const BottomNavBarScreen(),
      pushReplacment: true,
    );
  }

  initAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<Offset>(begin: const Offset(-1, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
