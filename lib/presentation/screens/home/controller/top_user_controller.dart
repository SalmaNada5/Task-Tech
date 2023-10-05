import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/home/models/top_user_model.dart';

class TopUserController {
  static final DioClient _dioClient = DioClient();
  static TopUserModel topUserModel = TopUserModel();
  static List<User> users = [];
  static int page = 1;
  static ScrollController highestRatedScrollController = ScrollController();

  static Future<List<User>?> getTopUsersFunc() async {
    try {
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      Response res = await _dioClient.get(
              'api/v1/users/topuser?page=$page', token,)
          as Response;

      topUserModel = TopUserModel.fromJson(res.data);
      users.addAll(topUserModel.data!.users);
      page = page + 1;
      logSuccess('top users returned successfully: ${topUserModel.status}');
      return users;
    } catch (e) {
      if (page == topUserModel.paginationResult?.numberOfPages) {
        page = page + 1;
      }
      logError('error in getTopUserFunc ${e.toString()}');
    }
    return null;
  }
}
