import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/controller/auth_controller.dart';

class AddPostsController {
  static final DioClient _dioClient = DioClient();
  static final TextEditingController taskNameController =
      TextEditingController();
  static final TextEditingController descriptionController =
      TextEditingController();
  static final TextEditingController deliveryDaysController =
      TextEditingController();
  static final TextEditingController salaryController = TextEditingController();
  static final TextEditingController categoryController =
      TextEditingController();
  static final TextEditingController stController = TextEditingController();
  static FilePickerResult? selectedFiles;

  static Future<FilePickerResult?> attachNewFiles() async {
    final FilePickerResult? pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (pickedFiles != null) {
      return pickedFiles;
    }
    return null;
  }

  static Future<List<MultipartFile>> get multiParts async {
    List<MultipartFile> res = [];
    if (selectedFiles == null) {
      return [];
    }
    for (var i in selectedFiles!.files) {
      res.add(await _dioClient.fileToUploadFunc(i.path ?? "", i.name));
    }
    return res;
  }

  static Future<Map<String, dynamic>> get postedMap async => {
        'attachFile': await multiParts,
        'name': taskNameController.text,
        'description': descriptionController.text,
        'delieveryDate': deliveryDaysController.text,
        'softwareTool': stController.text,
        'salary': salaryController.text,
        'category': categoryController.text,
        'user': AuthController.authModel.data?.user?.id,
      };

  static Future<FormData> postedFormData() async =>
      _dioClient.formDataFunc(await postedMap);

  static Future<bool> uploadPostFunc() async {
    logWarning('im');
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    final formData = await postedFormData();
    try {
      Response res = await _dioClient.post(
        'api/v1/services',
        token,
        body: formData,
      ) as Response;
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error in uploadPostFunc ${e.toString()}');
    }
    return false;
  }
}
