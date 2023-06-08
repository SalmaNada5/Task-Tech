import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin Constants {
  static final navigatorKey = GlobalKey<NavigatorState>();

  //static bool demoLogin = false;

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
}
