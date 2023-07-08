import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

import '../../../../../constants/colors.dart';

// ignore: non_constant_identifier_names
AppBar MyAppbar({required double percent}) {
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: white,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return Center(
          child: IconButton(
              iconSize: 50,
              onPressed: () {},
              icon: Image.asset(
                'icons/profile.png',
              )),
        );
      },
    ),
    centerTitle: true,
    title: const Padding(
      padding: EdgeInsetsDirectional.only(
        start: 55,
      ),
      child: Text(
        'Create Profile',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    ),
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: RoundedProgressBar(
          percent: percent,
          height: 9,
          borderRadius: BorderRadius.circular(12),
          style: RoundedProgressBarStyle(
              widthShadow: 0,
              borderWidth: 0,
              colorProgress: primaryLightColor,
              backgroundProgress: const Color.fromRGBO(217, 217, 217, 1)),
        )),
  );
}
