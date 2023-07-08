import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/home/models/search_service_model.dart';

class SearchServiceController {
  static final DioClient _dioClient = DioClient();
  static SearchServiceModel searchServiceModel = SearchServiceModel();
  static Future<SearchServiceModel?> searchServiceFunc(
      String searchQuery) async {
    try {
      String token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token") ?? '';
      Response res = await _dioClient.get(
        'api/v1/services/$searchQuery/search-service',
        token,
      ) as Response;
      searchServiceModel = SearchServiceModel.fromJson(res.data);
      logSuccess('service search result: $searchServiceModel');
      return searchServiceModel;
    } catch (e) {
      logError('error in searchServiceFunc ${e.toString()}');
    }
    return null;
  }
}
