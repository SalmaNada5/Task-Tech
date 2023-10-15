part of 'add_post_cubit.dart';

sealed class AddPostState extends Equatable {
  const AddPostState();

  @override
  List<Object> get props => [];
}

final class AddPostInitial extends AddPostState {}

final class AddPostAttachFileState extends AddPostState {}

final class TaskAddPostAttachFileState extends AddPostState {}

final class FileDisSelectedState extends AddPostState {}

final class TaskFileDisSelectedState extends AddPostState {}

final class SelectCategoryState extends AddPostState {}
