import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/controller/auth_controller.dart';
import 'package:task_tech/presentation/screens/auth/models/auth_model.dart';
import 'package:task_tech/presentation/screens/auth/view/reset_password_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/sign_in_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/verification_code_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/view/screens/create_profile.dart';
import 'package:task_tech/presentation/screens/home/view/bottom_nav_bar_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginCubit(String email, String password) async {
    AuthModel? authModel = await AuthController.loginFunc(email, password);
    if (authModel == null) {
      return Constants.errorMessage(description: 'Invalid email or password!');
    } else {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", authModel.token!);
      pref.setString("id", AuthController.authModel.data!.user!.id!);
      return Constants.navigateTo(const BottomNavBarScreen(),
          pushAndRemoveUntil: true);
    }
  }

  Future<void> signupCubit(
      {required String email,
      required String password,
      required String name,
      required String confirmPassword}) async {
    AuthModel? authModel = await AuthController.signUpFunc(
        email: email,
        password: password,
        name: name,
        confirmPassword: confirmPassword);
    if (authModel == null) {
      return Constants.errorMessage();
    } else {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", authModel.token ?? "");
      Constants.navigateTo(
        const VerificationScreen(
          fromSignup: true,
        ),
      );
    }
  }

  Future<void> verifysignUpCubit(String code) async {
    bool? result = await AuthController.verifySignupFunc(code);
    if (result!) {
      Constants.navigateTo(const CreateProfile(), pushAndRemoveUntil: true);
    } else {
      Constants.errorMessage(description: 'Invalid code');
    }
  }

  Future<void> resetCodeCubit(String code) async {
    bool? result = await AuthController.verifyResetCodeFunc(code);
    if (result!) {
      Constants.navigateTo(const ResetPassword(), pushAndRemoveUntil: true);
    } else {
      Constants.errorMessage(description: 'Invalid code');
    }
  }

  Future<void> forgotPassCubit(String pass) async {
    bool? correctEmail = await AuthController.forgetPassword(pass) ?? false;

    if (correctEmail) {
      Constants.navigateTo(const VerificationScreen(fromSignup: false));
    } else {
      Constants.errorMessage(description: 'Wrong email address');
    }
  }

  Future<void> resetPassCubit(
      {required String email,required String password,required String confirmPassword}) async {
    bool? resetPassword = await AuthController.resetPasswordFunc(
        email: email, password: password, confirmPassword: confirmPassword);
    if (resetPassword!) {
      Constants.navigateTo(const SignInScreen(), pushAndRemoveUntil: true);
    } else {
      Constants.errorMessage();
    }
  }
}
