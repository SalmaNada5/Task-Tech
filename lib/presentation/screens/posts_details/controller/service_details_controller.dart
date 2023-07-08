import 'package:dio/dio.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/posts_details/models/service_details_model.dart';

class ServiceController {
  static final DioClient _dioClient = DioClient();
  static ServiceDetailsModel serviceDetailsModel = ServiceDetailsModel();
  static Future<ServiceDetailsModel?> getServiceFunc(String id) async {
    try {
      Response res =
          await _dioClient.get('api/v1/services/$id', '') as Response;
      serviceDetailsModel = ServiceDetailsModel.fromJson(res.data);
      logSuccess('Sercice Details: $serviceDetailsModel');
      return serviceDetailsModel;
    } catch (e) {
      logError('error in getServiceFunc');
    }
    return null;
  }
}
