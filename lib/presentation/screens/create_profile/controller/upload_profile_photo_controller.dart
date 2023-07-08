import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';

class UploadProfilePhotoController {
  static final DioClient _dioClient = DioClient();
  static FilePickerResult? selectedPhoto;

  static Future<FilePickerResult?> attachPhoto() async {
    final FilePickerResult? pickedFile =
        await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      selectedPhoto = pickedFile;
      return pickedFile;
    }
    return null;
  }

  static Future<bool> uploadProfilePhotoFunc() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    final formData = FormData.fromMap({
      'photo': [
        await MultipartFile.fromFile(selectedPhoto?.files.first.path ?? "",
            filename: selectedPhoto?.files.first.name),
      ],
    });
    logWarning("formData ${formData.fields}");
    logWarning("formData ${formData.files.first.value.filename}");
    try {
      Response res = await _dioClient.patch(
        'api/v1/users/createprofile/uploadphoto/me',
        token,
        useFormData: true,
        body: formData,
      ) as Response;
      if (res.statusCode == 200 || res.statusCode == 201) {
        logSuccess('Profile photo uploaded successfully!');
        return true;
      }
      return false;
    } catch (e) {
      logError('error in uploadProfilePhotoFunc ${e.toString()}');
    }
    return false;
  }
}
