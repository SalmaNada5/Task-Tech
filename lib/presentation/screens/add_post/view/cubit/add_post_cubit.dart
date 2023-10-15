import 'package:equatable/equatable.dart';
import 'package:task_tech/utils/exports.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

  final formKey = GlobalKey<FormState>();
  String selectedCategory = 'Web Design';

  void selectCategoryFunction(String value, String category) {
    emit(AddPostInitial());
    selectedCategory = value;
    category = value;
    emit(SelectCategoryState());
  }

//* post service logic
  String? serviceFileName;
  bool serviceFileDisSelected = false;

  void serviceAttachFileFunction(String name) {
    emit(AddPostInitial());
    serviceFileName = name;
    serviceFileDisSelected = false;
    emit(AddPostAttachFileState());
  }

  void serviceFileDisSelectedFunction() {
    emit(AddPostInitial());
    serviceFileDisSelected = true;
    emit(FileDisSelectedState());
  }

  //* post task logic
  String? taskFileName;
  bool taskFileDisSelected = false;

  void taskAttachFileFunction(String name) {
    emit(AddPostInitial());
    taskFileName = name;
    taskFileDisSelected = false;
    emit(TaskAddPostAttachFileState());
  }

  void taskFileDisSelectedFunction() {
    emit(AddPostInitial());
    taskFileDisSelected = true;
    emit(TaskFileDisSelectedState());
  }
}
