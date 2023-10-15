import 'package:equatable/equatable.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/comments_controller.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/task_details_controller.dart';
import 'package:task_tech/utils/exports.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit() : super(PostDetailsInitial());

//* task details logic
  TextEditingController commentController = TextEditingController();
  bool showIcon = false;
  Future<void> getTaskDetailsFunction(String postId) async {
    getAllCommentsFunction(postId);
    await TaskController.getTaskFunc(postId);
  }

  void onCommentTextFieldValueChanged(String value) {
    emit(PostDetailsInitial());
    commentController.text = value;
    commentController.selection =
        TextSelection.collapsed(offset: commentController.text.length);
    value.isNotEmpty ? showIcon = true : showIcon = false;
    emit(CommentTextFieldValueChangedState());
  }

  Future<void> addCommentFunction(String postId) async {
    emit(PostDetailsInitial());
    await CommentsController.addComment(postId, commentController.text);
    getAllCommentsFunction(postId);
    commentController.clear();
    emit(CommentAddedSuccessfullyState());
  }

  bool enableCommentsShimmer = false;
  void getAllCommentsFunction(String postId) async {
    enableCommentsShimmer = true;
    try {
      emit(PostDetailsInitial());
      await CommentsController.getAllComments(postId);

      emit(AllCommentsReturnedSuccessfully());
      enableCommentsShimmer = false;
    } catch (e) {
      enableCommentsShimmer = true;
      logError('$e in getAllCommentsFunction');
    }
  }
}
