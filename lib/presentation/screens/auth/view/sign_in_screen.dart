import 'package:task_tech/utils/exports.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    bool isDarkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
            child: BlocBuilder<AuthCubit, AuthState>(
              bloc: authCubit,
              buildWhen: (prevState, currState) =>
                  currState is LoginObsecureOff ||
                  currState is LoginObsecureOn ||
                  currState is RememberMeOn ||
                  currState is RememberMeOff,
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome back,',
                      style: titleStyle.copyWith(
                        color:
                            isDarkMode ? Colors.white : const Color(0xff165069),
                      ),
                    ),
                    Text(
                      'Sign in your account',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff7C7C7C),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: labelTextFormStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            controller: emailController,
                            obscure: false,
                            fillColor: Theme.of(context).canvasColor,
                            borderColor: Theme.of(context).canvasColor,
                            hintText: 'Enter your mail',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              value = emailController.text;
                              if (value.isEmpty) {
                                return 'Please enter your email address';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Password',
                            style: labelTextFormStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            controller: passController,
                            fillColor: Theme.of(context).canvasColor,
                            borderColor: Theme.of(context).canvasColor,
                            validator: (value) {
                              value = passController.text;
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            icon: IconButton(
                              icon: Icon(
                                authCubit.obsecureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                              ),
                              onPressed: () {
                                authCubit.obsecureLogic();
                              },
                            ),
                            obscure: authCubit.obsecureText,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: authCubit.rememberMe,
                                    checkColor: Theme.of(context).primaryColor,
                                    fillColor:
                                        const WidgetStatePropertyAll(Colors.white),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onChanged: (value) {
                                      authCubit.rememberMeLogic();
                                    },
                                    side: const BorderSide(
                                        color: Color(0xffB1B1B1)),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xffB1B1B1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Constants.navigateTo(
                                    const ForgotPasswordScreen()),
                                child: Text(
                                  'Forgot password?',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xffB1B1B1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await authCubit.loginCubit(
                                      emailController.text,
                                      passController.text);
                                }
                              },
                              style: ButtonStyle(
                                padding: const WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 15)),
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).primaryColor),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenH / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 1,
                          width: 0.2 * screenW,
                          child: Container(
                            color: const Color(0xffB1B1B1),
                          ),
                        ),
                        const Text(
                          '  Or SignUp With  ',
                          style: TextStyle(
                            color: Color(0xffB1B1B1),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          width: 0.25 * screenW,
                          child: Container(
                            color: const Color(0xffB1B1B1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenH / 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignWith(
                          child: Image.asset(
                            'images/google.png',
                            width: 30,
                            height: 30,
                          ),
                          onPress: () {},
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SignWith(
                          child: const Icon(
                            Icons.facebook,
                            size: 30,
                            color: Color(0xff395185),
                          ),
                          onPress: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenH / 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: GoogleFonts.poppins(
                            color: const Color(0xff7C7C7C),
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Signup',
                            style: GoogleFonts.poppins(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          onTap: () =>
                              Constants.navigateTo(const SignUpScreen()),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ).withUnfocus(context);
  }
}
