import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/create_profile/create_profile.dart';
import 'package:task_tech/presentation/screens/onboarding_screen.dart';
import 'package:task_tech/presentation/screens/forgot_password_screen.dart';
import 'package:task_tech/presentation/screens/home/create_post_screen.dart';
import 'package:task_tech/presentation/screens/home/categories_screen.dart';
import 'package:task_tech/presentation/screens/home/home_screen.dart';
import 'package:task_tech/presentation/screens/home/notifications_screen.dart';
import 'package:task_tech/presentation/screens/home/profile_screen.dart';
import 'package:task_tech/presentation/screens/reset_password_screen.dart';
import 'package:task_tech/presentation/screens/sign_in.dart';
import 'package:task_tech/presentation/screens/sign_up_screen.dart';
import 'package:task_tech/presentation/screens/splash_screen.dart';
import 'package:task_tech/presentation/screens/unexpected_error_screen.dart';
import 'package:task_tech/presentation/screens/verification_code_screen.dart';

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
      initialRoute: 'splash',
    );
  }
}
