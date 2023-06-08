import 'package:dio/dio.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/models/login_model.dart';
import 'auth_body.dart';

class AuthController {
  static final DioClient _dioClient = DioClient();

  static Future<AuthModel?> loginFunc(String email, String password) async {
    try {
      Response res = await _dioClient.post(
        'api/v1/users/login',
        '',
        body: AuthBody.loginMap(email, password),
      ) as Response;
      AuthModel loginModel = AuthModel.fromJson(res.data);
      logSuccess('loginModel token : ${loginModel.token}');
      return loginModel;
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

      AuthModel signupModel = AuthModel.fromJson(res.data);
      logSuccess('signupModel token : ${signupModel.token}');
      return signupModel;
    } catch (e) {
      logError('error in signUpFunc ${e.toString()}');
    }
    return null;
  }

  static Future<bool> forgetPassword(String email) async {
    try {
      Response res = await _dioClient.post(
        'api/v1/users/forgetpassword',
        '',
        body: AuthBody.forgetPasswordMap(email),
      ) as Response;
      if (res.statusCode != 200) {
        return false;
      }
      return true;
    } catch (e) {
      logError('error in loginFunc ${e.toString()}');
      return false;
    }
  }
}
