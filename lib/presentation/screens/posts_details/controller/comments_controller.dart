import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/posts_details/models/comments_model.dart';

class CommentsController {
  static final DioClient _dioClient = DioClient();
  static CommentsModel commentsModel = CommentsModel();
  static List<Comment> comments = [];
  static Future<List<Comment>?> getAllComments(String postId) async {
    try {
     
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      Response res = await _dioClient.get(
          'api/v1/posts/$postId/comments', token) as Response;
      commentsModel = CommentsModel.fromJson(res.data);
      comments.clear();
      comments.addAll(commentsModel.data!.comments ?? []);
      logSuccess('all comments returned successfuly: $commentsModel');
      return comments;
    } catch (e) {
      logError('error in getAllComments: $e');
    }
    return null;
  }

  static Future<bool?> addComment(String postId, String comment) async {
    try {
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      Response res = await _dioClient.post(
              'api/v1/posts/$postId/comments', token, body: {"text": comment})
          as Response;
      logSuccess('comment added successfuly: ${res.statusCode}');
      return true;
    } catch (e) {
      logError('error in addComment: $e');
    }
    return false;
  }
}
