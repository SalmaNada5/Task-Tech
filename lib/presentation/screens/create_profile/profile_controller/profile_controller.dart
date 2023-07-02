import 'package:dio/dio.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_controller/profile_body.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_controller/profile_model.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_controller/proile_photo_model.dart';

class ProfileController {
  static final DioClient _dioClient = DioClient();
  static CreateProfileModel profileModel = CreateProfileModel();
  static ProfilePhotoModel profilePhotoModel = ProfilePhotoModel();

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
      logSuccess('create profile status : ${profileModel.status}');
      return profileModel;
    } catch (e) {
      logError('error in create profile ${e.toString()}');
    }
    return null;
  }

static Future<ProfilePhotoModel?> addProfilePhoto({
  String? photo
})async{
  try {
    Response res = await _dioClient.patch(
      'api/v1/users/createprofile/uploadphoto/me',
       "",
        body: CreateProfileBody.uploadProfilePhotoMap(photo!)
        )as Response;
        profilePhotoModel = ProfilePhotoModel.fromJson(res.data);
        return profilePhotoModel;

    
  } catch (e) {
    logError('error in add profile photo ${e.toString()}');
  }
  return null;
}


}
