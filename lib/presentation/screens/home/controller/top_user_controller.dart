import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/home/models/top_user_model.dart';

class TopUserController {
  static final DioClient _dioClient = DioClient();
  static TopUserModel topUserModel = TopUserModel();
  static List<User> users = [];
  static int page = 1;
  static ScrollController scrollController = ScrollController();

  static Future<List<User>?> getTopUsersFunc({bool dioLoading = true}) async {
    try {
      Response res = await _dioClient.get('api/v1/users/topuser?page=$page', '',
          isLoading: dioLoading) as Response;
      topUserModel = TopUserModel.fromJson(res.data);
      users.addAll(topUserModel.data!.users);
      //if(topUserModel.paginationResult?.numberOfPages != page){
      page = page + 1;
      //}
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
