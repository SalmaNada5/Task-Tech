import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/create_profile/create_profile.dart';
import 'package:task_tech/presentation/screens/create_profile/education_screen.dart';

import 'presentation/screens/create_profile/chat_detail_screen.dart';
import 'presentation/screens/create_profile/skills_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateProfile(),
     /*  routes: {
        'splash': (context) => const SplashScreen(),
        'onboarding': (context) => const OnboardingScreen(),
        'signUp': (context) => const SignUpScreen(),
        'signIn': (context) => const SignInScreen(),
        'forgotPassword': (context) => const ForgotPasswordScreen(),
        'verification': (context) => const VerificationScreen(),
        'resetPassword': (context) => const ResetPassword(),
        'unexpectedError': (context) => const UnexpectedErrorScreen(),
        'home': (context) => const HomeScreen(),
        'addPost': (context) => const AddPostScreen(),
        'notifications': (context) => const NotificationsScreen(),
        'profile': (context) => const ProfilePage(),
        'categories': (context) => const CategoriesScreen(),
        'createProfile': (context) => const CreateProfile(),
      },
      initialRoute: 'splash', */
    );
  }
}
