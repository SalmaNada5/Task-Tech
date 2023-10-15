import 'package:task_tech/utils/exports.dart';

class PostTask extends StatelessWidget {
  const PostTask({super.key});

  @override
  Widget build(BuildContext context) {
    AddPostCubit addPostCubit = BlocProvider.of<AddPostCubit>(context);
    return ReusablePostForm(
      onPressed: () async {
        await AddPostsController.uploadTaskFunc();
        await PostController.getTaskPosts();
        Constants.navigateTo(const BottomNavBarScreen());
      },
      firstLabel: 'Name of your Task',
      postNameController: AddPostsController.taskNameController,
      descriptionController: AddPostsController.taskeDescriptionController,
      deliveryDaysController: AddPostsController.taskDeliveryDaysController,
      salaryController: AddPostsController.taskSalaryController,
      categoryController: AddPostsController.taskCategoryController,
      stController: AddPostsController.taskStController,
      difFields: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell us about your Task',
            textAlign: TextAlign.center,
            style: headStyle.copyWith(
                color: Theme.of(context).textTheme.headlineSmall!.color),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: AddPostsController.taskeDescriptionController,
            style: headStyle.copyWith(color: Theme.of(context).hintColor),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context).canvasColor,
                      //Colors.white,
                    )),
                filled: true,
                fillColor: Theme.of(context).canvasColor,
                hintText: 'Description',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xffC0C0C0),
                )),
            onChanged: (value) {
              AddPostsController.taskeDescriptionController.text =
                  value.toString();
              AddPostsController.taskeDescriptionController.selection =
                  TextSelection.fromPosition(TextPosition(
                      offset: AddPostsController
                          .taskeDescriptionController.text.length));
            },
            validator: (value) {
              value = AddPostsController.taskeDescriptionController.text;
              if (value.isEmpty) {
                return 'Please fill this field';
              } else {
                return '';
              }
            },
          ),
          Text(
            'Attach File',
            textAlign: TextAlign.center,
            style: headStyle.copyWith(
                color: Theme.of(context).textTheme.headlineSmall!.color),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<AddPostCubit, AddPostState>(
            bloc: addPostCubit,
            builder: (context, state) {
              return TextFormField(
                onTap: () async {
                  AddPostsController.taskSelectedFiles =
                      await AddPostsController.attachNewFilesInAddTask();
                  String fileN = '';
                  if (AddPostsController.taskSelectedFiles != null) {
                    for (var element
                        in AddPostsController.taskSelectedFiles!.files) {
                      fileN += '${element.path!.split('/').last}, ';
                    }
                  }
                  addPostCubit.taskAttachFileFunction(fileN);
                },
                readOnly: true,
                style: headStyle.copyWith(color: Theme.of(context).hintColor),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 15),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).canvasColor,
                    prefixIcon: addPostCubit.taskFileDisSelected
                        ? null
                        : addPostCubit.taskFileName == null
                            ? null
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      addPostCubit.taskFileName ?? '',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        addPostCubit
                                            .taskFileDisSelectedFunction();
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                    suffixIcon: const Icon(
                      Icons.attach_file,
                      size: 20,
                      color: Colors.grey,
                    )),
                onChanged: (value) {
                  //AddPostsController.attachFileController.text = value.toString();
                  // AddPostsController.attachFileController.selection =
                  //     TextSelection.fromPosition(TextPosition(
                  //         offset:
                  //             AddPostsController.attachFileController.text.length));
                },
                maxLines: 1,
              );
            },
          ),
        ],
      ),
    );
  }
}
