import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/payment/model/payment_model.dart';

class PaymentController {
  static final DioClient _dioClient = DioClient();
  static PaymentModel paymentModel = PaymentModel();

  static Future<PaymentModel?> paymentFunc(String? serviceId) async {
    try {
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      Response res = await _dioClient.get(
          'api/v1/orders/checkout-session/$serviceId', token) as Response;
      paymentModel = PaymentModel.fromJson(res.data);
      logSuccess('paymentFunc: ${res.statusCode}');
      return paymentModel;
    } catch (e) {
      logError('error in paymentFunc: $e');
    }
    return null;
  }
}
