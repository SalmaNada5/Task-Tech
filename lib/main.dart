import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/splash_screen.dart';
import 'package:task_tech/routes.dart';

String? email;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString("email");
  debugPrint(email);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Constants.navigatorKey,
      debugShowCheckedModeBanner: false,
      routes: Routing.routes,
      home: SplashScreen(email: email),
    );
  }
}
