import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/models/cur_user_info_model.dart';

class CurrentUserInfoController {
  static final DioClient _dioClient = DioClient();
  static UserInfoModel userInfoModel = UserInfoModel();

  static Future<UserInfoModel?> getUserInfoFunc() async {
    try {
      String token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token") ?? '';
      Response res = await _dioClient.get(
        'api/v1/users/me',
        token,
      ) as Response;
      userInfoModel = UserInfoModel.fromJson(res.data);
      logSuccess('User info returned successfully: $userInfoModel');
      return userInfoModel;
    } catch (e) {
      logError('error in getUserInfoFunc: ${e.toString()}');
    }
    return null;
  }
}
