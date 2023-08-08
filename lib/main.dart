import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/cubits/cubit/auth_cubit.dart';
import 'package:task_tech/presentation/screens/auth/view/splash_screen.dart';
import 'package:task_tech/presentation/screens/chat_screens/view/chats_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/view/screens/create_profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(value: AuthCubit(),),
      ],
      child: MaterialApp(
          navigatorKey: Constants.navigatorKey,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()),
    );
  }
}
