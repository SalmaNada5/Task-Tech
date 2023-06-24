import 'package:dio/dio.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_controller/profile_body.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_controller/profile_model.dart';

class ProfileController {
  static final DioClient _dioClient = DioClient();
  static CreateProfileModel profileModel = CreateProfileModel();

  static Future<CreateProfileModel?> createProfileFunc( {
     List<String>? skills,
    String? jop,
     String? about,
     var age,
     var birthDate,
     String? catogery,
     String? currency,
     String? education,
     String? ferquency,
     String? gender,
     String? location,
     int? maximum,
     int? minimum,
     String? phoneNumber,
  }) async {
    try {
      Response res = await _dioClient.patch(
        'api/v1/users/createprofile/me',
        '',
        body: CreateProfileBody.createProfileMap(
            skills!,
            jop!,
            about!,
            age!,
            birthDate!,
            catogery!,
            currency!,
            education!,
            ferquency!,
            gender!,
            location!,
            maximum!,
            minimum!,
            phoneNumber!),
      ) as Response;

      profileModel = CreateProfileModel.fromJson(res.data);
      //logSuccess('loginModel token : ${profileModel.status}');
      return profileModel;
    } catch (e) {
      logError('error in loginFunc ${e.toString()}');
    }
    return null;
  }
}
