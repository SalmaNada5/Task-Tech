import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/add_post/controller/add_post_controller.dart';
import 'package:task_tech/presentation/screens/add_post/view/reusable_form.dart';

class PostTask extends StatefulWidget {
  const PostTask({super.key});

  @override
  State<PostTask> createState() => _PostTaskState();
}

class _PostTaskState extends State<PostTask> {
  String? fileName;
  bool fileDisSelected = false;
  @override
  Widget build(BuildContext context) {
    return ReusablePostForm(
      onPressed: () {
        AddPostsController.uploadTaskFunc();
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
            style: headStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: AddPostsController.taskeDescriptionController,
            style: headStyle,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )),
                filled: true,
                fillColor: const Color(0xffF5F5F5),
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
            style: headStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
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
              setState(() {
                fileName = fileN;
                fileDisSelected = false;
              });
            },
            readOnly: true,
            style: headStyle,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: const Color(0xffF5F5F5),
                prefixIcon: fileDisSelected
                    ? null
                    : fileName == null
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
                                  fileName ?? '',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      fileDisSelected = true;
                                    });
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
                )),
            onChanged: (value) {
              //AddPostsController.attachFileController.text = value.toString();
              // AddPostsController.attachFileController.selection =
              //     TextSelection.fromPosition(TextPosition(
              //         offset:
              //             AddPostsController.attachFileController.text.length));
            },
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
