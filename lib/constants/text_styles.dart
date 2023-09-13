import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';

TextStyle titleStyle = GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: FontWeight.w500,
  color: AdaptiveTheme.of(Constants.navigatorKey.currentContext!).mode ==
          AdaptiveThemeMode.dark
      ? Colors.white
      : const Color(0xff165069),
);

TextStyle labelTextFormStyle = GoogleFonts.poppins(
  color: Theme.of(Constants.navigatorKey.currentContext!)
      .textTheme
      .headlineSmall!
      .color,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle headStyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

TextStyle postNameStyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: const Color(0xff165069),
);
TextStyle postDescriptionStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: const Color(0xff7C7C7C),
);
