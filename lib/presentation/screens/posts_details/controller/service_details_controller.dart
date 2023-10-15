import 'package:task_tech/presentation/screens/posts_details/models/service_details_model.dart';
import 'package:task_tech/utils/exports.dart';

class ServiceController {
  static final DioClient _dioClient = DioClient();
  static ServiceDetailsModel serviceDetailsModel = ServiceDetailsModel();
  static Future<ServiceDetailsModel?> getServiceFunc(String id) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
   // try {
      Response res =
          await _dioClient.get('api/v1/services/$id', token) as Response;
      serviceDetailsModel = ServiceDetailsModel.fromJson(res.data);
      logSuccess('Sercice Details: $serviceDetailsModel');
      return serviceDetailsModel;
    // } catch (e) {
    //   logError('error in getServiceFunc $e');
    // }
   // return null;
  }
}
