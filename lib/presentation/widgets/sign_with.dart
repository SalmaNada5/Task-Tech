import 'package:flutter/material.dart';

class SignWith extends StatelessWidget {
  final Widget child;
  final Function() onPress;
  const SignWith({super.key, required this.child, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(6),
          shadowColor: MaterialStateProperty.all(Colors.white)),
      onPressed: onPress,
      child: Center(child: child),
    );
  }
}
