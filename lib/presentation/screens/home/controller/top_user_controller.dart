import 'package:dio/dio.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/home/models/top_user_model.dart';

class TopUserController {
  static final DioClient _dioClient = DioClient();
  static TopUserModel topUserModel = TopUserModel();

  static Future<TopUserModel?> getTopUsersFunc() async {
    try {
      Response res =
          await _dioClient.get('api/v1/users/topuser', '') as Response;
      topUserModel = TopUserModel.fromJson(res.data);
      logSuccess('top users returned successfully: ${topUserModel.status}');
      return topUserModel;
    } catch (e) {
      logError('error in getTopUserFunc ${e.toString()}');
    }
    return null;
  }
}
