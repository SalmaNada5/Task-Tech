import 'package:flutter/material.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/sign_in_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/splash_screen.dart';
import 'package:task_tech/presentation/screens/chat_screens/view/chats_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Constants.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const SignInScreen());
  }
}
