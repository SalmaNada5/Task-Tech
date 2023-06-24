import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/home/models/category_model.dart';

class CategoryController {
  static final DioClient _dioClient = DioClient();
  static CategoryModel categoryModel = CategoryModel();
  static List<CategoryElement> categories = [];
  static int page = 1;
  static ScrollController scrollController = ScrollController();

  static Future<List<CategoryElement>?> getPopularCategoriesFunc(
      {bool dioLoading = true}) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient.get(
          'api/v1/categorys/?type=popular&page=$page', token,
          isLoading: dioLoading) as Response;

      categoryModel = CategoryModel.fromJson(res.data);
      categories.addAll(categoryModel.data!.category);
      page = page + 1;
      logSuccess(
          'popular categories returned successfully: ${categoryModel.status}');
      return categories;
    } catch (e) {
      if (page == categoryModel.paginationResult?.numberOfPages) {
        page = page + 1;
      }
      logError('error in getPopularCategoriesFunc ${e.toString()}');
    }
    return null;
  }
}
