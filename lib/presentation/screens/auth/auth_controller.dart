import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/models/login_model.dart';

class AuthController {
  static final DioClient _dioClient = DioClient();

  static Future<LoginModel?> loginFunc(String email, String password) async {
    try {
      var res = await _dioClient.post('api/v1/users/login', '',
          postMap: {"email": email, "password": password});
      LoginModel loginModel = LoginModel.fromJson(res as Map<String, dynamic>);
      logSuccess('loginModel token : ${loginModel.token}');
      return loginModel;
    } catch (e) {
      logError('error in loginFunc ${e.toString()}');
    }
    return null;
  }
}
