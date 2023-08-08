import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/auth/cubits/cubit/auth_cubit.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/Reset password-pana 1.png',
                height: Constants.screenHeight * 0.45,
              ),
              Text(
                'Your new password must be different from\nthe passwird you used previously',
                textAlign: TextAlign.center,
                style: labelTextFormStyle.copyWith(
                  fontSize: 16,
                  color: const Color(0xff3E4446),
                ),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  BlocProvider.of<AuthCubit>(context).resetPassCubit(
                      email: emailController.text,
                      password: newPassController.text,
                      confirmPassword: confirmPassController.text);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      vertical: 10, horizontal: 0.35 * Constants.screenWidth)),
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
            ],
          ),
        ),
      ),
    );
  }
}
