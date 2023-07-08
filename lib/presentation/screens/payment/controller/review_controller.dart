import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';

class ReviewController {
  static final DioClient _dioClient = DioClient();

  static Future<bool?> addReviewFunc(
      num rating, String review, String reviewee, String reviewer) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient.post(
        'api/v1/reviews/',
        token,
        body: {
          "rating": rating,
          "review": review,
          "reviewee": reviewee,
          "reviewer": reviewer
        },
      ) as Response;
      if (res.statusCode == 200 || res.statusCode == 201) {
        logSuccess('Review Added Successfully');
        return true;
      }
      return false;
    } catch (e) {
      logError('error in addReviewFunc: $e');
      return false;
    }
  }
}
