import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/controller/cur_user_controller.dart';

class AddPostsController {
  static final DioClient _dioClient = DioClient();
  static final TextEditingController serviceNameController =
      TextEditingController();
  static final TextEditingController serviceDescriptionController =
      TextEditingController();
  static final TextEditingController serviceDeliveryDaysController =
      TextEditingController();
  static final TextEditingController serviceSalaryController =
      TextEditingController();
  static final TextEditingController serviceCategoryController =
      TextEditingController();
  static final TextEditingController serviceStController =
      TextEditingController();
  static FilePickerResult? serviceSelectedFiles;

  static final TextEditingController taskNameController =
      TextEditingController();
  static final TextEditingController taskeDescriptionController =
      TextEditingController();
  static final TextEditingController taskDeliveryDaysController =
      TextEditingController();
  static final TextEditingController taskSalaryController =
      TextEditingController();
  static final TextEditingController taskCategoryController =
      TextEditingController();
  static final TextEditingController taskStController = TextEditingController();
  static FilePickerResult? taskSelectedFiles;

  static String userId =
      CurrentUserInfoController.userInfoModel.data?.user.id ?? '';

  static Future<FilePickerResult?> attachNewFiles() async {
    final FilePickerResult? pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (pickedFiles != null) {
      serviceSelectedFiles = pickedFiles;
      return pickedFiles;
    }
    return null;
  }

  static Future<FilePickerResult?> attachNewFilesInAddTask() async {
    final FilePickerResult? pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (pickedFiles != null) {
      taskSelectedFiles = pickedFiles;
      return pickedFiles;
    }
    return null;
  }

  static Future<bool> uploadServiceFunc() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    final formData = FormData.fromMap({
      'attachFile': [
        await MultipartFile.fromFile(
            serviceSelectedFiles?.files.first.path ?? "",
            filename: serviceSelectedFiles?.files.first.name),
      ],
      'name': serviceNameController.text,
      'description': serviceDescriptionController.text,
      'delieveryDate': serviceDeliveryDaysController,
      'softwareTool': serviceStController.text,
      'salary': serviceSalaryController.text,
      'category': serviceCategoryController.text,
      'user': userId,
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
      logError('error in uploadServiceFunc ${e.toString()}');
    }
    return false;
  }

  static Future<bool> uploadTaskFunc() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    final formData = FormData.fromMap({
      'attachFile': [
        await MultipartFile.fromFile(taskSelectedFiles?.files.first.path ?? "",
            filename: taskSelectedFiles?.files.first.name),
      ],
      'name': taskNameController.text,
      'description': taskeDescriptionController.text,
      'delieveryDate': taskDeliveryDaysController,
      'softwareTool': taskStController.text,
      'salary': taskSalaryController.text,
      'catogery': taskCategoryController.text,
      'user': userId,
    });
    logWarning("formData ${formData.fields}");
    logWarning("formData ${formData.files.first.value.filename}");
    try {
      Response res = await _dioClient.post(
        'api/v1/posts',
        token,
        useFormData: true,
        body: formData,
      ) as Response;
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      logError('error in uploadTaskFunc ${e.toString()}');
    }
    return false;
  }
}
