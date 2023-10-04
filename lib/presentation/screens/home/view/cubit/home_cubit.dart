import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/models/cur_user_info_model.dart';
import 'package:task_tech/presentation/screens/home/models/category_model.dart';
import 'package:task_tech/presentation/screens/home/models/related_posts_model.dart';
import 'package:task_tech/presentation/screens/home/models/top_user_model.dart'
    as top_user;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final DioClient _dioClient = DioClient();
  initCubit() {
    getUserInfoFunc();
    getPopularCategoriesFunc();
    getRelatedPostsFunc();
    getTopUsersFunc();
  }

// user info
  UserInfoModel userInfoModel = UserInfoModel();
  bool userInfoEnableShimmer = true;

  getUserInfoFunc({bool dioLoading = true}) async {
    emit(HomeInitial());
    try {
      String token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token") ?? '';
      Response res = await _dioClient.get('api/v1/users/me', token,
          isLoading: dioLoading) as Response;
      userInfoModel = UserInfoModel.fromJson(res.data);
      logSuccess('User info returned successfully: $userInfoModel');
      userInfoEnableShimmer = false;
      emit(GetUserInfoSucces());
    } catch (e) {
      emit(GetUserInfoError());
      logError('error in getUserInfoFunc: ${e.toString()}');
    }
  }

  // popular categories
  CategoryModel categoryModel = CategoryModel();
  bool categoriesEnableShimmer = true;

  List<CategoryElement> categories = [];
  int categoriesPage = 1;
  ScrollController categoriesScrollContrller = ScrollController();

  getPopularCategoriesFunc({bool dioLoading = true}) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    emit(HomeInitial());
    try {
      Response res = await _dioClient.get(
          'api/v1/categorys/?type=popular&page=$categoriesPage', token,
          isLoading: dioLoading) as Response;

      categoryModel = CategoryModel.fromJson(res.data);
      categories.addAll(categoryModel.data!.category);
      categoriesPage = categoriesPage + 1;
      logSuccess(
          'popular categories returned successfully: ${categoryModel.status}');
      categoriesEnableShimmer = false;
      emit(GetPopularCategoriesSucces());
    } catch (e) {
      if (categoriesPage == categoryModel.paginationResult?.numberOfPages) {
        categoriesPage = categoriesPage + 1;
      }
      emit(GetPopularCategoriesError());
      logError('error in getPopularCategoriesFunc ${e.toString()}');
    }
  }

  //related posts

  RelatedPostModel relatedPostModel = RelatedPostModel();
  bool relatedPostsEnableShimmer = true;

  List<Post> posts = [];
  int relatedPostspage = 1;
  ScrollController scrollController = ScrollController();

  getRelatedPostsFunc({bool dioLoading = true}) async {
    String? token, id;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    id = prefs.getString("id");
    emit(HomeInitial());
    try {
      Response res = await _dioClient.get(
          'api/v1/users/$id/relatedPosts?page=$relatedPostspage', token,
          isLoading: dioLoading) as Response;

      relatedPostModel = RelatedPostModel.fromJson(res.data);
      posts.addAll(relatedPostModel.data?.posts ?? []);
      relatedPostspage = relatedPostspage + 1;
      logSuccess(
          'related posts returned successfully: ${relatedPostModel.status}');
      relatedPostsEnableShimmer = false;
      emit(GetRelatedPostsSucces());
    } catch (e) {
      if (relatedPostspage ==
          relatedPostModel.paginationResult?.numberOfPages) {
        relatedPostspage = relatedPostspage + 1;
      }
      logError('error in getRelatedPostsFunc ${e.toString()}');
      emit(GetRelatedPostsError());
    }
  }

  //highest rated freelancers
  top_user.TopUserModel topUserModel = top_user.TopUserModel();
  bool topUsersEnableShimmer = true;

  List<top_user.User> users = [];
  int page = 1;
  ScrollController highestRatedScrollController = ScrollController();

  getTopUsersFunc({bool dioLoading = true}) async {
    emit(HomeInitial());
    try {
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      Response res = await _dioClient.get(
              'api/v1/users/topuser?page=$page', token, isLoading: dioLoading)
          as Response;

      topUserModel = top_user.TopUserModel.fromJson(res.data);
      users.addAll(topUserModel.data!.users);
      page = page + 1;
      logSuccess('top users returned successfully: ${topUserModel.status}');
      topUsersEnableShimmer = false;
      emit(GetTopUsersSucces());
    } catch (e) {
      if (page == topUserModel.paginationResult?.numberOfPages) {
        page = page + 1;
      }
      logError('error in getTopUserFunc ${e.toString()}');
      emit(GetTopUsersError());
    }
  }
}

//! scroll controllers 

// final bool isCatLoading = false;
//   final bool isLoading = false;
//   final bool relatedPostsLoading = false;
//   final bool photoReturned = false;

  // Future<void> highestRatedScrollController() async {
  //   TopUserController.highestRatedScrollController.addListener(() async {
  //     if (TopUserController.highestRatedScrollController.position.atEdge &&
  //         TopUserController.highestRatedScrollController.position.pixels != 0) {
  //       if (TopUserController.page >
  //           (TopUserController.topUserModel.paginationResult?.numberOfPages ??
  //               1)) {
  //         return;
  //       }
  //       if (isLoading) {
  //         return;
  //       }
  //       // setState(() {
  //       //   //isLoading = true;
  //       //   Constants.enableShimmer = true;
  //       // });
  //       await TopUserController.getTopUsersFunc(dioLoading: false);
  //       // setState(() {
  //       //   Constants.enableShimmer = false;

  //       //   //isLoading = false;
  //       // });
  //     }
  //   });
  // }

  // Future<void> categoriesScrollController() async {
  //   CategoryController.categoriesScrollContrller.addListener(() async {
  //     if (CategoryController.categoriesScrollContrller.position.atEdge &&
  //         CategoryController.categoriesScrollContrller.position.pixels != 0) {
  //       if (CategoryController.page >
  //           (CategoryController.categoryModel.paginationResult?.numberOfPages ??
  //               1)) {
  //         return;
  //       }
  //       if (isCatLoading) {
  //         return;
  //       }
  //       // setState(() {
  //       //   Constants.enableShimmer = true;
  //       // });
  //       await CategoryController.getPopularCategoriesFunc(dioLoading: false);
  //       // setState(() {
  //       //   Constants.enableShimmer = false;
  //       // });
  //     }
  //   });
  // }

  // Future<void> relatedPostsScrollController() async {
  //   RelatedPostscontroller.scrollController.addListener(() async {
  //     if (RelatedPostscontroller.scrollController.position.atEdge &&
  //         RelatedPostscontroller.scrollController.position.pixels != 0) {
  //       if (RelatedPostscontroller.page >
  //           (RelatedPostscontroller
  //                   .relatedPostModel.paginationResult?.numberOfPages ??
  //               1)) {
  //         return;
  //       }
  //       if (relatedPostsLoading) {
  //         return;
  //       }
  //       // setState(() {
  //       //   //relatedPostsLoading = true;
  //       //   Constants.enableShimmer = true;
  //       // });
  //       await RelatedPostscontroller.getRelatedPostsFunc(dioLoading: false);
  //       // setState(() {
  //       //   // relatedPostsLoading = false;
  //       //   Constants.enableShimmer = false;
  //       // });
  //     }
  //   });
  // }
