part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class TaskPostsReturnedSuccessfully extends PostsState {}

final class TaskPostsReturnedUnSuccessfully extends PostsState {}

final class ServicePostsReturnedSuccessfully extends PostsState {}

final class ServicePostsReturnedUnSuccessfully extends PostsState {}

final class DropDownItemSelectedState extends PostsState {}
