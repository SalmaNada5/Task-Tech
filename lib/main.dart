import 'package:flutter/material.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/sign_in_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/sign_up_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/splash_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/create_profile.dart';
import 'package:task_tech/presentation/screens/create_profile/education_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/skills_screen.dart';
import 'package:task_tech/presentation/screens/chat_screens/chats_screen.dart';

String? email;
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
      //routes: Routing.routes,
      //SplashScreen(email: email),
      home: const CreateProfile(),
    );
  }
}