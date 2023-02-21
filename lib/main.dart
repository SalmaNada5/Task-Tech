
import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/create_profile/createProfile.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_screen.dart';
import 'package:task_tech/presentation/screens/onboarding_screen.dart';
import 'package:task_tech/presentation/screens/forgot_password_screen.dart';
import 'package:task_tech/presentation/screens/onboarding_screen.dart';
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
      /*routes: {
        '/splash': (context) => const SplashScreen(),
      routes: {
        'splash': (context) => const SplashScreen(),
        'onboarding': (context) => const OnboardingScreen(),
        'signUp': (context) => const SignUpScreen(),
        'signIn': (context) => const SignInScreen(),
        'forgotPassword': (context) => const ForgotPasswordScreen(),
        'verification': (context) => const VerificationScreen(),
        'resetPassword': (context) => const ResetPassword(),
        'unexpectedError': (context) => const UnexpectedErrorScreen(),
      },
      initialRoute: '/splash',*/

      home: CreateProfile(),
      /*routes: {
        '/splash': (context) => const SplashScreen(),
        'onboarding': (context) => const OnboardingScreen(),
      },*/
      
      //initialRoute: '/splash',
      initialRoute: 'splash',
    );
  }
}
