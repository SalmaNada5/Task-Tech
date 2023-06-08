import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/widgets/text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // double screenH = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    TextEditingController forgotPassEmailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Forgot Password',
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
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/Forgot password-amico 1.png'),
                Text(
                  'The verification code will be sent to your\nE-mail, please check it.',
                  textAlign: TextAlign.center,
                  style: labelTextFormStyle.copyWith(
                    color: const Color(0xff3E4446),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: forgotPassEmailController,
                  obscure: false,
                  validator: (email) {
                    email = forgotPassEmailController.text.toString();
                    if (email.isEmpty) {
                      return 'Enter your email!';
                    } else {
                      Constants.unFocusFunc();
                      return null;
                    }
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint('valid');
                      Navigator.pushNamed(context, 'verification');
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 40),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(primaryLightColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  child: Text(
                    'Send code',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}