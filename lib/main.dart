import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/onboarding_screen.dart';
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
      routes: {
        'onboarding': (context) => const OnboardingScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
