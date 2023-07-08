import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';

class UploadCVController {
  static final DioClient _dioClient = DioClient();
  static FilePickerResult? selectedCV;

  static Future<FilePickerResult?> attachCV() async {
    final FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (pickedFiles != null) {
      selectedCV = pickedFiles;
      return pickedFiles;
    }
    return null;
  }

  static Future<bool> uploadCVFunc() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    final formData = FormData.fromMap({
      'cv': await MultipartFile.fromFile(selectedCV?.files.first.path ?? "",
          filename: selectedCV?.files.first.name),
    });
    logWarning("formData ${formData.fields}");
    logWarning("formData ${formData.files.first.value.filename}");
    try {
      Response res = await _dioClient.patch(
        'api/v1/users/createprofile/uploadcv/me',
        token,
        useFormData: true,
        body: formData,
      ) as Response;
      if (res.statusCode == 200 || res.statusCode == 201) {
        logSuccess('CV uploaded successfully!');
        return true;
      }
      return false;
    } catch (e) {
      logError('error in uploadCVFunc ${e.toString()}');
    }
    return false;
  }
}
