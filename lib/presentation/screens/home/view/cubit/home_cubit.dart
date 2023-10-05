import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/models/cur_user_info_model.dart';
import 'package:task_tech/presentation/screens/home/models/category_model.dart';
import 'package:task_tech/presentation/screens/home/models/get_user_model.dart';
import 'package:task_tech/presentation/screens/home/models/related_posts_model.dart';
import 'package:task_tech/presentation/screens/home/models/top_user_model.dart'
    as top_user;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final DioClient _dioClient = DioClient();
  initCubit() {
    categoriesScrollControllerFunc();
    relatedPostsScrollControllerFunc();
    getUserInfoFunc();
    getPopularCategoriesFunc();
    getRelatedPostsFunc();
    getTopUsersFunc();
  }

  Future<String> getToken() async {
    String? token;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? '';
    return token;
  }

//? user info

  UserInfoModel userInfoModel = UserInfoModel();
  bool userInfoEnableShimmer = false;

  getUserInfoFunc() async {
    emit(HomeInitial());
    userInfoEnableShimmer = true;
    try {
      String token = await getToken();
      Response res = await _dioClient.get(
        'api/v1/users/me',
        token,
        isLoading: false,
      ) as Response;
      userInfoModel = UserInfoModel.fromJson(res.data);
      logSuccess('User info returned successfully: $userInfoModel');
      userInfoEnableShimmer = false;
      emit(GetUserInfoSucces());
    } catch (e) {
      emit(GetUserInfoError());
      logError('error in getUserInfoFunc: ${e.toString()}');
    }
  }

  //? popular categories logic

  CategoryModel categoryModel = CategoryModel();
  bool categoriesEnableShimmer = false;

  List<CategoryElement> categories = [];
  int categoriesPage = 1;
  ScrollController categoriesScrollController = ScrollController();

  getPopularCategoriesFunc() async {
    emit(HomeInitial());
    categoriesEnableShimmer = true;
    try {
      String token = await getToken();

      Response res = await _dioClient.get(
        'api/v1/categorys/?type=popular&page=$categoriesPage',
        token,
        isLoading: false,
      ) as Response;

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

  bool categoriesLoading = false;
  categoriesScrollControllerFunc() {
    categoriesScrollController.addListener(() async {
      if (categoriesScrollController.position.atEdge &&
          categoriesScrollController.position.pixels != 0) {
        if (categoriesPage >
            (categoryModel.paginationResult?.numberOfPages ?? 1)) {
          return;
        }
        categoriesLoading = true;
        getPopularCategoriesFunc();
        categoriesLoading = false;
      }
    });
  }

  //? related posts logic

  RelatedPostModel relatedPostModel = RelatedPostModel();
  bool relatedPostsEnableShimmer = false;
  List<Post> posts = [];
  int relatedPostspage = 1;
  ScrollController scrollController = ScrollController();

  getRelatedPostsFunc() async {
    String? token, id;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    id = prefs.getString("id");
    emit(HomeInitial());
    categoriesEnableShimmer = true;
    try {
      Response res = await _dioClient.get(
        'api/v1/users/$id/relatedPosts?page=$relatedPostspage',
        token,
        isLoading: false,
      ) as Response;
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

  bool relatesPostsLoading = false;
  ScrollController relatedPostsScrollController = ScrollController();
  relatedPostsScrollControllerFunc() {
    relatedPostsScrollController.addListener(() async {
      if (relatedPostsScrollController.position.atEdge &&
          relatedPostsScrollController.position.pixels != 0) {
        if (relatedPostspage >
            (relatedPostModel.paginationResult?.numberOfPages ?? 1)) {
          return;
        }
        relatesPostsLoading = true;
        await getRelatedPostsFunc();
        relatesPostsLoading = false;
      }
    });
  }

  //? highest rated freelancers logic

  top_user.TopUserModel topUserModel = top_user.TopUserModel();
  bool topUsersEnableShimmer = false;

  List<top_user.User> users = [];
  int highestRatedUsersPage = 1;
  ScrollController highestRatedScrollController = ScrollController();

  getTopUsersFunc() async {
    topUsersEnableShimmer = true;
    emit(HomeInitial());
    try {
      String token = await getToken();

      Response res = await _dioClient.get(
        'api/v1/users/topuser?page=$highestRatedUsersPage',
        token,
        isLoading: false,
      ) as Response;

      topUserModel = top_user.TopUserModel.fromJson(res.data);
      users.addAll(topUserModel.data!.users);
      highestRatedUsersPage = highestRatedUsersPage + 1;
      logSuccess('top users returned successfully: ${topUserModel.status}');
      topUsersEnableShimmer = false;
      emit(GetTopUsersSucces());
    } catch (e) {
      if (highestRatedUsersPage ==
          topUserModel.paginationResult?.numberOfPages) {
        highestRatedUsersPage = highestRatedUsersPage + 1;
      }
      logError('error in getTopUserFunc ${e.toString()}');
      emit(GetTopUsersError());
    }
  }

  bool topUserLoading = false;
  highestRatedUsersScrollControllerFunc() {
    highestRatedScrollController.addListener(() async {
      if (highestRatedScrollController.position.atEdge &&
          highestRatedScrollController.position.pixels != 0) {
        if (highestRatedUsersPage >
            (topUserModel.paginationResult?.numberOfPages ?? 1)) {
          return;
        }
        topUserLoading = true;
        getTopUsersFunc();
        topUserLoading = false;
      }
    });
  }

//! access user from top users in home (get data but not show info after navigating).
  UserModel userModel = UserModel();

  getUserByIdFunc(String userId) async {
    emit(HomeInitial());
    try {
      String token = await getToken();

      Response res = await _dioClient.get(
        'api/v1/users/$userId',
        token,
      ) as Response;
      userModel = UserModel.fromJson(res.data);
      logSuccess(
          'Specific User info returned successfully: ${userModel.status}');
      emit(GetSpecificUserSucces());
    } catch (e) {
      emit(GetSpecificUserError());
      logError('error in getUserByIdFunc ${e.toString()}');
    }
  }
}
