import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/home/models/related_posts_model.dart';

class RelatedPostscontroller {
  static final DioClient _dioClient = DioClient();
  static RelatedPostModel relatedPostModel = RelatedPostModel();
  static List<Post> posts = [];
  static int page = 1;
  static ScrollController scrollController = ScrollController();

  static Future<List<Post>?> getRelatedPostsFunc(
      {bool dioLoading = true}) async {
    String? token, id;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    id = prefs.getString("id");
    try {
      Response res = await _dioClient.get(
          'api/v1/users/$id/relatedPosts?page=$page', token,
          isLoading: dioLoading) as Response;

      relatedPostModel = RelatedPostModel.fromJson(res.data);
      posts.addAll(relatedPostModel.data!.posts);
      page = page + 1;
      logSuccess(
          'related posts returned successfully: ${relatedPostModel.status}');
      return posts;
    } catch (e) {
      if (page == relatedPostModel.paginationResult?.numberOfPages) {
        page = page + 1;
      }
      logError('error in getRelatedPostsFunc ${e.toString()}');
    }
    return null;
  }
}
