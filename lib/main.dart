import 'package:flutter/material.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/splash_screen.dart';

import 'presentation/screens/create_profile/create_profile.dart';

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
      home: const SplashScreen(),
    );
  }
}