import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/themes.dart';
import 'package:task_tech/presentation/screens/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:task_tech/presentation/screens/auth/view/splash_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/cubit/create_profile_cubit.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(
          value: AuthCubit(),
        ),
        BlocProvider<HomeCubit>.value(
          value: HomeCubit(),
        ),
         BlocProvider<CreateProfileCubit>.value(
          value: CreateProfileCubit(),
        ),
      ],
      child: AdaptiveTheme(
        light: AppThemes.lightTheme,
        dark: AppThemes.darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) {
          return MaterialApp(
              navigatorKey: Constants.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              home: const SplashScreen());
        },
      ),
    );
  }
}
