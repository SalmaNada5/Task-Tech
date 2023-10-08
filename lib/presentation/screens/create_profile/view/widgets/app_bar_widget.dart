import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:task_tech/constants/consts.dart';

AppBar myAppbar({required double percent}) {
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: Theme.of(Constants.navigatorKey.currentContext!)
        .scaffoldBackgroundColor,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        bool isDarkMode =
      AdaptiveTheme.of(context).mode ==
          AdaptiveThemeMode.dark;
        return Center(
          child: IconButton(
              iconSize: 50,
              onPressed: () {},
              icon:isDarkMode
                  ? Image.asset(
                      'icons/profile_dark.png',
                    )
                  : Image.asset(
                      'icons/profile.png',
                    )),
        );
      },
    ),
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 55,
      ),
      child: Text(
        'Create Profile',
        style: TextStyle(
            fontSize: 24,
            color: Theme.of(Constants.navigatorKey.currentContext!)
                .textTheme
                .headlineSmall!
                .color),
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
              colorProgress:
                  Theme.of(Constants.navigatorKey.currentContext!).primaryColor,
              backgroundProgress: const Color.fromRGBO(217, 217, 217, 1)),
        )),
  );
}
