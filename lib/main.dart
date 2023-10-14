
import 'package:task_tech/utils/exports.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
    
  );
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
        BlocProvider<ProfileCubit>.value(
          value: ProfileCubit(),
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
