import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/auth/cubits/cubit/auth_cubit.dart';
import 'package:task_tech/presentation/screens/auth/view/sign_in_screen.dart';
import 'package:task_tech/presentation/widgets/sign_with.dart';
import 'package:task_tech/presentation/widgets/text_form_field.dart';
import 'package:task_tech/presentation/widgets/unfocus.dart';
import 'package:task_tech/constants/consts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Create an account,',
                  style: titleStyle,
                ),
                Text(
                  'Let\'s create an acount together',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff7C7C7C),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formKey,
                  child: BlocBuilder<AuthCubit, AuthState>(
                    bloc: authCubit,
                    buildWhen: (prev, cur) =>
                        cur is SignUpPassVisible ||
                        cur is SignUpPassInVisible ||
                        cur is SignUpConfirmPassInVisible ||
                        cur is SignUpConfirmPassVisible,
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: labelTextFormStyle,
                          ),
                          CustomTextFormField(
                            controller: fullNameController,
                            obscure: false,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              value = fullNameController.text;
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            hintText: 'Enter your name',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email',
                            style: labelTextFormStyle,
                          ),
                          CustomTextFormField(
                            controller: emailController,
                            obscure: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              value = emailController.text;
                              if (value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            hintText: 'Enter your email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Password',
                            style: labelTextFormStyle,
                          ),
                          CustomTextFormField(
                            controller: passController,
                            validator: (value) {
                              value = passController.text;
                              if (value.length < 6) {
                                return 'password is too short';
                              }
                              return null;
                            },
                            icon: IconButton(
                              icon: Icon(
                               authCubit
                                        .signUpObsecureTextPass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                              ),
                              onPressed: () {
                                authCubit
                                    .obsecureSignUpPasswordLogic();
                              },
                            ),
                            obscure: authCubit
                                    .signUpObsecureTextPass
                                ? false
                                : true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Confirm Password',
                            style: labelTextFormStyle,
                          ),
                          CustomTextFormField(
                            controller: confirmPassController,
                            validator: (value) {
                              value = confirmPassController.text;
                              if (value != passController.text) {
                                return 'Wrong password';
                              }
                              return null;
                            },
                            icon: IconButton(
                              icon: Icon(
                                authCubit
                                        .signUpObsecureTextConfirmPass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                              ),
                              onPressed: () {
                                authCubit
                                    .obsecureSignUpConfirmPasswordLogic();
                              },
                            ),
                            obscure: authCubit
                                    .signUpObsecureTextConfirmPass
                                ? false
                                : true,
                          ),
                          SizedBox(
                            height: screenH / 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  authCubit
                                      .signupCubit(
                                          email: emailController.text,
                                          password: passController.text,
                                          name: fullNameController.text,
                                          confirmPassword:
                                              confirmPassController.text);
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
                                'Sign up',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
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
                      'Already have an account? ',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff7C7C7C),
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () => Constants.navigateTo(const SignInScreen()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).withUnfocus(context);
  }
}
