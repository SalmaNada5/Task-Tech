import 'package:task_tech/utils/exports.dart';

class PostService extends StatelessWidget {
  const PostService({super.key});

  @override
  Widget build(BuildContext context) {
    AddPostCubit addPostCubit = BlocProvider.of<AddPostCubit>(context);
    return ReusablePostForm(
      onPressed: () async {
        logWarning(AddPostsController.serviceDeliveryDaysController.text);
        await AddPostsController.uploadServiceFunc();
        await PostController.getServicePosts();
        Constants.navigateTo(const BottomNavBarScreen());
      },
      postNameController: AddPostsController.serviceNameController,
      descriptionController: AddPostsController.serviceDescriptionController,
      deliveryDaysController: AddPostsController.serviceDeliveryDaysController,
      salaryController: AddPostsController.serviceSalaryController,
      categoryController: AddPostsController.serviceCategoryController,
      stController: AddPostsController.serviceStController,
      firstLabel: 'Name of your service',
      difFields: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            textAlign: TextAlign.center,
            style: headStyle.copyWith(
                color: Theme.of(context).textTheme.headlineSmall!.color),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: AddPostsController.serviceDescriptionController,
            style: headStyle.copyWith(color: Theme.of(context).hintColor),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    color: Theme.of(context).canvasColor,
                  )),
              filled: true,
              fillColor: Theme.of(context).canvasColor,
            ),
            onChanged: (value) {
              AddPostsController.serviceDescriptionController.text =
                  value.toString();
              AddPostsController.serviceDescriptionController.selection =
                  TextSelection.fromPosition(TextPosition(
                      offset: AddPostsController
                          .serviceDescriptionController.text.length));
            },
            validator: (value) {
              value = AddPostsController.serviceDescriptionController.text;
              if (value.isEmpty) {
                return 'Please fill this field';
              } else {
                return '';
              }
            },
            maxLines: 1,
          ),
          const SizedBox(
            height: 10,
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
                  AddPostsController.serviceSelectedFiles =
                      await AddPostsController.attachNewFiles();
                  String fileN = '';
                  if (AddPostsController.serviceSelectedFiles != null) {
                    for (var element
                        in AddPostsController.serviceSelectedFiles!.files) {
                      fileN += '${element.path!.split('/').last}, ';
                    }
                  }
                  addPostCubit.serviceAttachFileFunction(fileN);
                },
                readOnly: true,
                style: headStyle,
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
                    prefixIcon: addPostCubit.serviceFileDisSelected
                        ? null
                        : addPostCubit.serviceFileName == null
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
                                      addPostCubit.serviceFileName ?? '',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        addPostCubit.serviceFileDisSelectedFunction();
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        size: 16,
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
                maxLines: 1,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
