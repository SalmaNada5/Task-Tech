part of 'home_cubit.dart';

base class HomeState extends Equatable {
  final UserInfoModel? userInfoModel;

  const HomeState({this.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userInfoModel': userInfoModel?.toJson(),
    };
  }

  factory HomeState.fromJson(Map<String, dynamic> map) {
    return HomeState(
      userInfoModel: map['userInfoModel'] != null
          ? UserInfoModel.fromJson(map['userModel'] as Map<String, dynamic>)
          : null,
    );
  }
  HomeState copyWith({
    UserInfoModel? userInfoModel,
  }) {
    return HomeState(
      userInfoModel: userInfoModel ?? this.userInfoModel,
    );
  }
}

final class HomeInitial extends HomeState {
  const HomeInitial({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetUserInfoSucces extends HomeState {
  const GetUserInfoSucces({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetUserInfoError extends HomeState {
   const GetUserInfoError({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetPopularCategoriesSucces extends HomeState {
  const GetPopularCategoriesSucces({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetPopularCategoriesError extends HomeState {
   const GetPopularCategoriesError({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetRelatedPostsSucces extends HomeState {
  const GetRelatedPostsSucces({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetRelatedPostsError extends HomeState {
   const GetRelatedPostsError({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetTopUsersSucces extends HomeState {
  const GetTopUsersSucces({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetTopUsersError extends HomeState {
   const GetTopUsersError({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetSpecificUserSucces extends HomeState {
  const GetSpecificUserSucces({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}

final class GetSpecificUserError extends HomeState {
   const GetSpecificUserError({super.userInfoModel});
  @override
  List<Object> get props => [
        if (userInfoModel != null) {userInfoModel},
      ];
}
