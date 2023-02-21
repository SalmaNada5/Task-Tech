import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/themes.dart';
import 'package:task_tech/presentation/widgets/text_form_field.dart';

import '../../constants/colors.dart';
import '../widgets/sign_with.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool _value = false;
  TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome back,',
                  style: titleTheme,
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: labelTextFormStyle,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        obscure: false,
                        hintText: 'Enter your mail',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          value = emailController.text;
                          if (value.isEmpty) {
                            return 'Please enter your email address';
                          } else {
                            return '';
                          }
                        },
                        onChange: (value) {
                          emailController.text = value.toString();
                        },
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
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return '';
                        },
                        onChange: (value) {
                          passController.text = value.toString();
                        },
                        icon: IconButton(
                          icon: Icon(
                            _isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                        ),
                        obscure: _isVisible ? false : true,
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
                                value: _value,
                                checkColor: primaryLightColor,
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onChanged: (value) {
                                  setState(() {
                                    _value = value!;
                                  });
                                },
                                side:
                                    const BorderSide(color: Color(0xffB1B1B1)),
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
                            onTap: () =>
                                Navigator.pushNamed(context, 'forgotPassword'),
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint('correct');
                            }
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryLightColor),
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
                  height: screenHeight / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Container(
                        color: const Color(0xffB1B1B1),
                      ),
                    ),
                    const Text(
                      '  Or Signip With  ',
                      style: TextStyle(
                        color: Color(0xffB1B1B1),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        color: const Color(0xffB1B1B1),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight / 22,
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
                  height: screenHeight / 18,
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
                            color: primaryLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () => Navigator.pushNamed(context, 'signUp'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
