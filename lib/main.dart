import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/createProfile.dart';
import 'package:task_tech/presentation/screens/appBarWidget.dart';
import 'package:task_tech/presentation/screens/onboarding_screen.dart';
import 'package:task_tech/presentation/screens/profile_screen.dart';
import 'package:task_tech/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
      /*routes: {
        '/splash': (context) => const SplashScreen(),
        'onboarding': (context) => const OnboardingScreen(),
      },
      initialRoute: '/splash',*/
    );
  }
}
