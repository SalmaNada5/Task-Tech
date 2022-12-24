// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/createProfile.dart';
<<<<<<< HEAD
import 'package:task_tech/presentation/screens/appBarWidget.dart';
=======
>>>>>>> 63030a3b91b0a55e435ea07eb3523e1620afeabb
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
<<<<<<< HEAD
      home: ProfileScreen(),
      /*routes: {
        '/splash': (context) => const SplashScreen(),
        'onboarding': (context) => const OnboardingScreen(),
      },
      initialRoute: '/splash',*/
=======

      home: CreateProfile(),
      /*routes: {
        '/splash': (context) => const SplashScreen(),
        'onboarding': (context) => const OnboardingScreen(),
      },*/
      
      //initialRoute: '/splash',
>>>>>>> 63030a3b91b0a55e435ea07eb3523e1620afeabb
    );
  }
}
