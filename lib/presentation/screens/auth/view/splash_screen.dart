import 'package:task_tech/utils/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.navigateToHomeOrOnboardingScreen(context.mounted);
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
          ? const Color(0xff165069)
          : const Color(0xff1B2936),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png'),
            Text(
              'TASK-TECH',
              style: GoogleFonts.redRose(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  shadows: [
                    Shadow(
                        color: Colors.white.withOpacity(0.15),
                        offset: const Offset(3, 4))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
