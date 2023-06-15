import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/auth/controller/auth_controller.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/sign_in.dart';
import 'package:task_tech/presentation/widgets/text_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _confirmpasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool? resetPassword = false;
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Reset Password',
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
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/Reset password-pana 1.png'),
              Text(
                'Your new password must be different from\nthe passwird you used previously',
                textAlign: TextAlign.center,
                style: labelTextFormStyle.copyWith(
                  fontSize: 16,
                  color: const Color(0xff3E4446),
                ),
              ),
              CustomTextFormField(
                controller: emailController,
                obscure: false,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  value = emailController.text;
                  if (value.isEmpty) {
                    return 'Please enter your email address';
                  } else {
                    return '';
                  }
                },
              ),
              CustomTextFormField(
                hintText: 'New password',
                icon: IconButton(
                  icon: Icon(
                    _confirmpasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _confirmpasswordVisible = !_confirmpasswordVisible;
                    });
                  },
                ),
                obscure: _confirmpasswordVisible ? false : true,
                controller: newPassController,
                validator: (value) {
                  value = newPassController.text.toString();
                  if (value.isEmpty) {
                    return 'please enter a valid email';
                  } else {
                    return '';
                  }
                },
              ),
              CustomTextFormField(
                hintText: 'Confirm password',
                icon: IconButton(
                  icon: Icon(
                    _confirmpasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _confirmpasswordVisible = !_confirmpasswordVisible;
                    });
                  },
                ),
                obscure: _confirmpasswordVisible ? false : true,
                controller: confirmPassController,
                validator: (value) {
                  value = confirmPassController.text.toString();
                  if (value != newPassController.text) {
                    return 'passwords does\'t match ';
                  } else {
                    return '';
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  resetPassword = await AuthController.resetPasswordFunc(
                      email: emailController.text,
                      password: newPassController.text,
                      confirmPassword: confirmPassController.text);
                  if (resetPassword!) {
                    Constants.navigateTo(const SignInScreen(),
                        pushAndRemoveUntil: true);
                  } else {
                    Constants.errorMessage();
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      vertical: 10, horizontal: 0.35 * screenW)),
                  backgroundColor: MaterialStateProperty.all(primaryLightColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                child: Text(
                  'Save',
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
    );
  }
}
