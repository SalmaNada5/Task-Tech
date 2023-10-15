import 'package:equatable/equatable.dart';
import 'package:task_tech/utils/exports.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  List<String> dropdownItemsList = ['Tasks', 'Services'];
  String dropDownItem = 'Tasks';

  void onDropDownItemSelected(String val) {
    emit(PostsInitial());
    dropDownItem = val;
    emit(DropDownItemSelectedState());
  }

  Future<void> onRefresh() async {
    if (dropDownItem == 'Tasks') {
      getAllTasksFunction(page: 1);
      return;
    }
    getAllServicesFunction(page: 1);
  }

  void getAllPosts() {
    getAllTasksFunction();
    getAllServicesFunction();
    taskPageScrollController();
    servicePageScrollController();
  }
//* tasks posts logic

  bool enableTasksShimmer = false;
  void getAllTasksFunction({int? page}) async {
    emit(PostsInitial());
    enableTasksShimmer = true;
    try {
      await PostController.getTaskPosts(dioLoading: false, page: page);
      enableTasksShimmer = false;
      emit(TaskPostsReturnedSuccessfully());
    } catch (e) {
      enableTasksShimmer = true;
      emit(TaskPostsReturnedUnSuccessfully());
      logError('$e in getAllTasksFunction');
    }
  }

  bool taskPostsLoading = false;
  void taskPageScrollController() async {
    PostController.scrollController.addListener(() async {
      if (PostController.scrollController.position.atEdge &&
          PostController.scrollController.position.pixels != 0) {
        if (PostController.taskPage >
            (PostController.postModel.paginationResult?.numberOfPages ?? 1)) {
          return;
        }
        if (taskPostsLoading) {
          return;
        }
        taskPostsLoading = true;
        getAllTasksFunction();
        taskPostsLoading = false;
      }
    });
  }

  //* services posts logic
  bool enableServicesShimmer = false;

  void getAllServicesFunction({int? page}) async {
    enableServicesShimmer = true;
    try {
      emit(PostsInitial());
      await PostController.getServicePosts(dioLoading: false, page: page);
      enableServicesShimmer = false;
      emit(ServicePostsReturnedSuccessfully());
    } catch (e) {
      enableServicesShimmer = true;
      emit(ServicePostsReturnedUnSuccessfully());
      logError('$e in getAllServicesFunction');
    }
  }

  bool servicePageLoading = false;
  void servicePageScrollController() async {
    PostController.scrollController.addListener(() async {
      if (PostController.scrollController.position.atEdge &&
          PostController.scrollController.position.pixels != 0) {
        if (PostController.servicePage >
            (PostController.serviceModel.paginationResult?.numberOfPages ??
                1)) {
          return;
        }
        if (servicePageLoading) {
          return;
        }
        servicePageLoading = true;
        getAllServicesFunction();
        servicePageLoading = false;
      }
    });
  }
}
