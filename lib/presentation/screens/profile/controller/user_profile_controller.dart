import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/profile/model/user_profile_model.dart';

class UserProfileController {
  static final DioClient _dioClient = DioClient();
  static UserProfileModel userProfileModel = UserProfileModel();
  static Future<UserProfileModel?> getUserProfileDataFunc() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient.get('api/v1/users/me', token) as Response;
      userProfileModel = UserProfileModel.fromJson(res.data);
      logSuccess('User Profile Info returned successfully!');
      return userProfileModel;
    } catch (e) {
      logError('error in getUserProfileDataFunc $e');
    }
    return null;
  }
  static Future<bool?> followUser(String id) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient
          .put('api/v1/users/$id/follow', token, body: {}) as Response;
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error in followUser: $e');
    }
    return false;
  }

  static Future<bool?> unFollowUser(String id) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient
          .put('api/v1/users/$id/unfollow', token, body: {}) as Response;
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error in unFollowUser: $e');
    }
    return false;
  }
}
