import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/onboarding_screen.dart';
import 'package:task_tech/presentation/screens/home/view/bottom_nav_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/logo.png'),
            const SizedBox(
              height: 10,
            ),
            Text(
              'TASK-TECH',
              style: GoogleFonts.redRose(
                  textStyle: TextStyle(
                    color: white,
                    fontSize: 30,
                  ),
                  shadows: [
                    Shadow(
                        color: Colors.white.withOpacity(0.15),
                        offset: const Offset(3, 4))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
