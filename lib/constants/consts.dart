import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin Constants {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final screenHeight =
      MediaQuery.sizeOf(navigatorKey.currentContext!).height;
  static final screenWidth =
      MediaQuery.sizeOf(navigatorKey.currentContext!).width;

  static void closeAppFunction() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
      return;
    }
    exit(0);
  }

  static void unFocusFunc() {
    //close keyboard with a random tap on screen
    FocusScope.of(navigatorKey.currentContext!).unfocus();
  }

  static Future<void> showLoading() async {
    return showDialog<void>(
      context: navigatorKey.currentContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  static void hideLoadingOrNavBack() => navigatorKey.currentState!.pop();

  static Future<void> navigateTo(Widget screen,
          {bool pushReplacment = false,
          bool pushAndRemoveUntil = false}) async =>
      pushReplacment
          ? await Navigator.pushReplacement(navigatorKey.currentContext!,
              MaterialPageRoute(builder: (_) => screen))
          : pushAndRemoveUntil
              ? await Navigator.pushAndRemoveUntil(navigatorKey.currentContext!,
                  MaterialPageRoute(builder: (_) => screen), (r) => false)
              : await Navigator.push(navigatorKey.currentContext!,
                  MaterialPageRoute(builder: (_) => screen));

  static Future<void> navigateToName(String name,
          {bool pushReplacment = false,
          bool pushAndRemoveUntil = false}) async =>
      pushReplacment
          ? await Navigator.pushReplacementNamed(
              navigatorKey.currentContext!, name)
          : pushAndRemoveUntil
              ? await Navigator.pushNamedAndRemoveUntil(
                  navigatorKey.currentContext!, name, (r) => false)
              : await Navigator.pushNamed(navigatorKey.currentContext!, name);

  static Future<dynamic> errorMessage(
      {String? title,
      String? description,
      Function? onPressed,
      bool removeCancelButton = true}) async {
    return navigatorKey.currentContext == null
        ? const SizedBox.shrink()
        : showDialog<void>(
            context: navigatorKey.currentContext!,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title ?? "Alert"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(description ?? "Error Occured"),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      if (onPressed != null) {
                        onPressed();
                      } else {
                        hideLoadingOrNavBack();
                      }
                    },
                  ),
                  removeCancelButton
                      ? const SizedBox.shrink()
                      : TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            hideLoadingOrNavBack();
                          },
                        ),
                ],
              );
            },
          );
  }

  static Future<dynamic> twoOptionDialog(
      {String? title,
      String? description,
      Function? onPressedOk,
      Function? onPressedCancel,
      Function? firstChoiceFunction,
      Function? secondChoiceFunction,
      bool removeCancelButton = true}) async {
    return navigatorKey.currentContext == null
        ? const SizedBox.shrink()
        : showDialog<void>(
            context: navigatorKey.currentContext!,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title ?? "Alert"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            if (firstChoiceFunction != null) {
                              firstChoiceFunction();
                            }
                          },
                          child: const Text("Open Camera")),
                      TextButton(
                          onPressed: () {
                            if (secondChoiceFunction != null) {
                              secondChoiceFunction();
                            }
                          },
                          child: const Text("Open File Manager")),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      if (onPressedOk != null) {
                        onPressedOk();
                      } else {
                        hideLoadingOrNavBack();
                      }
                    },
                  ),
                  removeCancelButton
                      ? const SizedBox.shrink()
                      : TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            if (onPressedCancel != null) {
                              onPressedCancel();
                            } else {
                              hideLoadingOrNavBack();
                            }
                          },
                        ),
                ],
              );
            },
          );
  }

  static String convertToTimeAgo(DateTime time) {
    DateTime now = DateTime.now();
    String timeAgo;
    if (now.month - time.month > 0) {
      timeAgo = '${now.month - time.month} m';
    } else if (now.day - time.day > 0) {
      if (now.day - time.day == 1) {
        timeAgo = '${now.day - time.day} day';
      } else {
        timeAgo = '${now.day - time.day} days';
      }
    } else if (now.hour - time.hour > 0) {
      timeAgo = '${now.hour - time.hour} hr';
    } else {
      timeAgo = '${now.minute - time.minute} min';
    }
    return timeAgo;
  }
}
