import 'package:flutter/material.dart';
import 'package:task_tech/constants/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: backgroundLightColor,
        child: const Text('onboarding'),
      )),
    );
  }
}
