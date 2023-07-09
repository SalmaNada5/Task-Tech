import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/profile_body.dart';

class CreateProfileController {
  static final DioClient _dioClient = DioClient();

  static Future<bool?> createProfileFunc(
      String about,
      int minimum,
      int maximum,
      String currency,
      String frequency,
      String job,
      String phoneNumber,
      String gender,
      String age,
      String birthDate,
      String location,
      List<String> skills,
      String education) async {
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
