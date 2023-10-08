import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xff165069),
    textTheme: const TextTheme(headlineSmall: TextStyle(color: Colors.black)),
    hintColor: Colors.black,
    canvasColor: const Color(0xffF5F5F5),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff1B2936),
    primaryColor: const Color(0xff6695A0),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: Colors.white),
    ),
    hintColor: Colors.white,
    canvasColor: const Color(0xff213440),
  );
}
