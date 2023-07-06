import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
// import 'package:task_tech/presentation/screens/auth/controller/auth_controller.dart';

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
      selectedFiles = pickedFiles;
      return pickedFiles;
    }
    return null;
  }

  static Future<MultipartFile?> get multiParts async {
    MultipartFile? res;
    logWarning('selectedFiles ${selectedFiles?.files}');
    if (selectedFiles == null) {
      return res;
    }
    res = await _dioClient.fileToUploadFunc(
        selectedFiles?.files.first.path ?? "",
        selectedFiles?.files.first.name ?? "");
    // for (var i in selectedFiles!.files) {
    //   res.add(await _dioClient.fileToUploadFunc(i.path ?? "", i.name));
    // }
    // for (var element in res) {
    //   logWarning("element.contentType ${element.contentType}");
    //   logWarning("element.headers ${element.headers}");
    //   logWarning("element.filename ${element.filename}");
    // }
    return res;
  }

  static Future<Map<String, dynamic>> get postedMap async => {
        'attachFile': await multiParts,
        'name': taskNameController.text,
        'description': descriptionController.text,
        'delieveryDate': '30',
        'softwareTool': stController.text,
        'salary': salaryController.text,
        'category': categoryController.text,
        'user': '6495dd3dd01f19004c40daa3',
      };

  static Future<FormData> postedFormData() async =>
      _dioClient.formDataFunc(await postedMap);

  static Future<bool> uploadPostFunc() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    final formData = FormData.fromMap({
      'attachFile': [
        await MultipartFile.fromFile(selectedFiles?.files.first.path ?? "",
            filename: selectedFiles?.files.first.name),
      ],
      'name': taskNameController.text,
      'description': descriptionController.text,
      'delieveryDate': '30',
      'softwareTool': stController.text,
      'salary': salaryController.text,
      'category': categoryController.text,
      'user': '6495dd3dd01f19004c40daa3',
    });
    logWarning("formData ${formData.fields}");
    logWarning("formData ${formData.files.first.value.filename}");
    try {
      Response res = await _dioClient.post(
        'api/v1/services',
        token,
        useFormData: true,
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
