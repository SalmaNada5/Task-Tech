import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/posts_details/models/task_details_model.dart';

class TaskController {
  static final DioClient _dioClient = DioClient();
  static TaskDetailsModel taskDetailsModel = TaskDetailsModel();
  static Future<TaskDetailsModel?> getTaskFunc(String id) async {
    try {
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      Response res =
          await _dioClient.get('api/v1/posts/$id', token) as Response;
      taskDetailsModel = TaskDetailsModel.fromJson(res.data);
      logSuccess('Task Details: $taskDetailsModel');
      return taskDetailsModel;
    } catch (e) {
      logError('error in getTaskFunc, $e');
    }
    return null;
  }
}
