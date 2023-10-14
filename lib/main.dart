import 'package:task_tech/utils/exports.dart';
import 'package:task_tech/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
          value: di.sl(),
        ),
        BlocProvider<HomeCubit>.value(
          value: di.sl(),
        ),
        BlocProvider<CreateProfileCubit>.value(
          value: di.sl(),
        ),
        BlocProvider<ProfileCubit>.value(
          value: di.sl(),
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
              home: const SkillsScreen());
        },
      ),
    );
  }
}
