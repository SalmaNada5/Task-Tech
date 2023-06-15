import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/controller/auth_controller.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/reset_password_screen.dart';
import 'package:task_tech/presentation/screens/home/home_screen.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_styles.dart';

String code = '';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.fromSignup});
  final bool fromSignup;

  @override
  Widget build(BuildContext context) {
    bool? correctCode = false;
    String d1 = '', d2 = '', d3 = '', d4 = '';
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Verification code',
            style: titleStyle,
          ),
          leading: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryLightColor,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          )),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/authentication.png'),
                Text(
                  'Enter the verification code we just sent you\non your e-mail address',
                  textAlign: TextAlign.center,
                  style: labelTextFormStyle.copyWith(
                    color: const Color(0xff3E4446),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.15 * screenW,
                  ),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                        (index) => CustomOneDigitField(
                          onChange: (String value) {
                            if (index == 0) {
                              d1 = value;
                            }
                            if (index == 1) {
                              d2 = value;
                            }
                            if (index == 2) {
                              d3 = value;
                            }
                            if (index == 3) {
                              d4 = value;
                            }
                            code = d1 + d2 + d3 + d4;
                            if (value.length == 1 && index != 3) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (fromSignup) {
                      correctCode = await AuthController.verifySignupFunc(code);
                      if (correctCode!) {
                        Constants.navigateTo(const HomeScreen(),
                            pushAndRemoveUntil: true);
                      } else {
                        //TODO -- handle error message
                        Constants.errorMessage();
                      }
                    } else {
                      correctCode =
                          await AuthController.verifyResetCodeFunc(code);
                      if (correctCode!) {
                        Constants.navigateTo(const ResetPassword(),
                            pushAndRemoveUntil: true);
                      } else {
                        //TODO -- handle error message
                        Constants.errorMessage();
                      }
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0.35 * screenW,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(primaryLightColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  child: Text(
                    'Verify',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t recieve a code?',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff8C8C8C),
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Resend',
                        style: titleStyle.copyWith(fontSize: 14),
                      ),
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

class CustomOneDigitField extends StatelessWidget {
  const CustomOneDigitField({super.key, required this.onChange});
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 54,
      child: TextField(
        onChanged: onChange,
        // (value) {
        //   if (value.length == 1) {
        //     FocusScope.of(context).nextFocus();
        //   }
        //},
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffF5F5F5))),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xffF5F5F5),
        ),
      ),
    );
  }
}
