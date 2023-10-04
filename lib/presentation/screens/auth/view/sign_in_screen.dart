import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:task_tech/presentation/screens/auth/view/forgot_password_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/sign_up_screen.dart';
import 'package:task_tech/presentation/widgets/sign_with.dart';
import 'package:task_tech/presentation/widgets/text_form_field.dart';
import 'package:task_tech/presentation/widgets/unfocus.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
            child: BlocBuilder<AuthCubit, AuthState>(
              bloc: BlocProvider.of<AuthCubit>(context),
              buildWhen: (prevState, currState) =>
                  currState is LoginObsecureOff ||
                  currState is LoginObsecureOn ||
                  currState is RememberMeOn ||
                  currState is RememberMeOff,
              builder: (context, state) {
                Color fieldColor =
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? const Color(0xff213440)
                        : const Color(0xffF5F5F5);

                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome back,',
                      style: titleStyle,
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
                            fillColor: fieldColor,
                            borderColor: fieldColor,
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
                            fillColor: fieldColor,
                            borderColor: fieldColor,
                            validator: (value) {
                              value = passController.text;
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            icon: IconButton(
                              icon: Icon(
                                BlocProvider.of<AuthCubit>(context).obsecureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                              ),
                              onPressed: () {
                                BlocProvider.of<AuthCubit>(context)
                                    .obsecureLogic();
                              },
                            ),
                            obscure: BlocProvider.of<AuthCubit>(context)
                                .obsecureText,
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
                                    value: BlocProvider.of<AuthCubit>(context)
                                        .rememberMe,
                                    checkColor: Theme.of(context).primaryColor,
                                    fillColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onChanged: (value) {
                                      BlocProvider.of<AuthCubit>(context)
                                          .rememberMeLogic();
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
                                  await BlocProvider.of<AuthCubit>(context)
                                      .loginCubit(emailController.text,
                                          passController.text);
                                }
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 15)),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                                shape: MaterialStateProperty.all(
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
