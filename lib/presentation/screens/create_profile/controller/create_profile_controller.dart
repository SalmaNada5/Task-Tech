import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/profile_body.dart';

class CreateProfileController {
  static final DioClient _dioClient = DioClient();

  static Future<bool?> createProfileFunc(
      {String? about,
      required int minimum,
      required int maximum,
      required String currency,
      required String frequency,
      required String job,
      required String phoneNumber,
      required String gender,
      required String age,
      required String birthDate,
      required String location,
      required List<String> skills,
      required String education}) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient.patch(
        'api/v1/users/createprofile/me',
        token,
        body: ProfileBody.profileMap(
            about: about,
            minimum: minimum,
            maximum: maximum,
            currency: currency,
            ferquency: frequency,
            job: job,
            phoneNumber: phoneNumber,
            gender: gender,
            age: age,
            birthDate: birthDate,
            location: location,
            skills: skills,
            education: education),
      ) as Response;
      if (res.statusCode == 201 || res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error with CreateProfileFunc: ${e.toString()}');
      return false;
    }
  }
}
