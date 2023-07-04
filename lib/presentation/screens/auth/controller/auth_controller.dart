import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/models/auth_model.dart';
import 'auth_body.dart';

class AuthController {
  static final DioClient _dioClient = DioClient();
  static AuthModel authModel = AuthModel();

  static Future<AuthModel?> loginFunc(String email, String password) async {
    try {
      Response res = await _dioClient.post(
        'api/v1/users/login',
        '',
        body: AuthBody.loginMap(email, password),
      ) as Response;
      authModel = AuthModel.fromJson(res.data);
      logSuccess('loginModel token : ${authModel.token}');
      return authModel;
    } catch (e) {
      logError('error in loginFunc ${e.toString()}');
    }
    return null;
  }

  static Future<AuthModel?> signUpFunc(
      {required String email,
      required String password,
      required String name,
      required String confirmPassword}) async {
    try {
      Response res = await _dioClient.post('api/v1/users/signup', '',
          body: AuthBody.signUpMap(
              email: email,
              password: password,
              name: name,
              confirmPassword: confirmPassword)) as Response;

      authModel = AuthModel.fromJson(res.data);
      logSuccess('signupModel token : ${authModel.token}');
      return authModel;
    } catch (e) {
      logError('error in signUpFunc ${e.toString()}');
    }
    return null;
  }

  static Future<bool?> verifySignupFunc(String code) async {
    try {
      Response res = await _dioClient.post(
        'api/v1/users/verfiysignup',
        '${authModel.token}',
        body: AuthBody.verifyResetCodeMap(code),
      ) as Response;
      if (res.statusCode == 201 || res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error in verifyResetCodeFunc ${e.toString()}');
      return false;
    }
  }

  static Future<bool?> forgetPassword(String email) async {
    try {
      Response res = await _dioClient.post(
        'api/v1/users/forgetpassword',
        '',
        body: AuthBody.forgetPasswordMap(email),
      ) as Response;
      if (res.statusCode == 201 || res.statusCode == 200) {
        return true;
      } else {
        debugPrint('error ${res.statusCode}');
        return false;
      }
    } catch (e) {
      logError('error in loginFunc ${e.toString()}');
      return false;
    }
  }

  static Future<bool?> verifyResetCodeFunc(String code) async {
    try {
      Response res = await _dioClient.post(
        'api/v1/users/verifyresetcode',
        '',
        body: AuthBody.verifyResetCodeMap(code),
      ) as Response;
      if (res.statusCode == 201 || res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error in verifyResetCodeFunc ${e.toString()}');
      return false;
    }
  }

  static Future<bool?> resetPasswordFunc(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      Response res = await _dioClient.patch(
        'api/v1/users/resetpassword',
        '',
        body: AuthBody.resetPassMap(
            email: email, password: password, confirmPassword: confirmPassword),
      ) as Response;
      if (res.statusCode == 201 || res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error in forgotPassFunc ${e.toString()}');
      return false;
    }
  }

// static Future<String> getName() async {
//     String? name;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     name = prefs.getString("name") ?? '';
//     return name;
//   }
}
