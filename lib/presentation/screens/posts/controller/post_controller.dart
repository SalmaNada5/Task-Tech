import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/posts/models/post_model.dart';
import 'package:task_tech/presentation/screens/posts/models/service_model.dart';

class PostController {
  static final DioClient _dioClient = DioClient();
  static PostModel postModel = PostModel();
  static ServiceModel serviceModel = ServiceModel();
  static List<Post> tasks = [];
  static List<Service> services = [];

  static int taskPage = 1;
  static int servicePage = 1;
  static ScrollController scrollController = ScrollController();
  static Future<List<Post>?> getTaskPosts(
      {bool dioLoading = true, int? page}) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient.get(
        'api/v1/posts?sort=-createdAt&fields=user,description,createdAt&page=${page ?? taskPage}',
        token,
        isLoading: dioLoading,
      ) as Response;
      postModel = PostModel.fromJson(res.data);
      tasks.addAll(postModel.data?.posts ?? []);
      taskPage = page ?? taskPage + 1;
      logSuccess('tasks returned successfully: ${postModel.status}');
      return tasks;
    } catch (e) {
      if (taskPage == postModel.paginationResult?.numberOfPages) {
        taskPage = page ?? taskPage + 1;
      }
      logError('error in getTaskPosts ${e.toString()}');
    }
    return null;
  }

  static Future<List<Service>?> getServicePosts(
      {bool dioLoading = true, int? page}) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    // try {
    Response res = await _dioClient.get(
      'api/v1/services?sort=-createdAt&fields=user,description&page=$servicePage',
      token,
      isLoading: dioLoading,
    ) as Response;
    serviceModel = ServiceModel.fromJson(res.data);
    services.addAll(serviceModel.data!.services);
    servicePage = page ?? servicePage + 1;
    logSuccess('services returned successfully: ${serviceModel.status}');
    return services;
    // } catch (e) {
    //   if (servicePage == serviceModel.paginationResult?.numberOfPages) {
    //     servicePage = servicePage + 1;
    //   }
    //   logError('error in getServicePosts ${e.toString()}');
    // }
    // return null;
  }
}
