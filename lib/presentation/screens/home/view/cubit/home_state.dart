part of 'home_cubit.dart';

@immutable
sealed class HomeState {}
final class HomeInitial extends HomeState {}

final class GetUserInfoSucces extends HomeState {}
final class GetUserInfoError extends HomeState {}

final class GetPopularCategoriesSucces extends HomeState {}
final class GetPopularCategoriesError extends HomeState {}

final class GetRelatedPostsSucces extends HomeState {}
final class GetRelatedPostsError extends HomeState {}

final class GetTopUsersSucces extends HomeState {}
final class GetTopUsersError extends HomeState {}

final class GetSpecificUserSucces extends HomeState {}
final class GetSpecificUserError extends HomeState {}