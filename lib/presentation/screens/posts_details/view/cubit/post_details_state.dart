part of 'post_details_cubit.dart';

sealed class PostDetailsState extends Equatable {
  const PostDetailsState();

  @override
  List<Object> get props => [];
}

final class PostDetailsInitial extends PostDetailsState {}

final class AllCommentsReturnedSuccessfully extends PostDetailsState {}

final class CommentTextFieldValueChangedState extends PostDetailsState {}

final class CommentAddedSuccessfullyState extends PostDetailsState {}
