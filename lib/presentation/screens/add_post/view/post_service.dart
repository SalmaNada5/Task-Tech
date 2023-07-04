import 'package:flutter/material.dart';

import 'package:task_tech/presentation/screens/add_post/controller/add_post_controller.dart';
import 'package:task_tech/presentation/screens/add_post/view/reusable_form.dart';

import '../../../../constants/text_styles.dart';

class PostService extends StatefulWidget {
  const PostService({super.key});

  @override
  State<PostService> createState() => _PostServiceState();
}

class _PostServiceState extends State<PostService> {
  String? fileName;
  bool fileDisSelected = false;
  @override
  Widget build(BuildContext context) {
    return ReusablePostForm(
      onPressed: () {
        AddPostsController.uploadPostFunc();
      },
      taskNameController: AddPostsController.taskNameController,
      descriptionController: AddPostsController.descriptionController,
      deliveryDaysController: AddPostsController.deliveryDaysController,
      salaryController: AddPostsController.salaryController,
      categoryController: AddPostsController.categoryController,
      stController: AddPostsController.stController,
      firstLabel: 'Name of your service',
      difFields: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            textAlign: TextAlign.center,
            style: headStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: AddPostsController.descriptionController,
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
            ),
            onChanged: (value) {
              AddPostsController.descriptionController.text = value.toString();
              AddPostsController.descriptionController.selection =
                  TextSelection.fromPosition(TextPosition(
                      offset: AddPostsController
                          .descriptionController.text.length));
            },
            validator: (value) {
              value = AddPostsController.descriptionController.text;
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
            style: headStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onTap: () async {
              AddPostsController.selectedFiles =
                  await AddPostsController.attachNewFiles();
              String fileN = '';
              if (AddPostsController.selectedFiles != null) {
                for (var element in AddPostsController.selectedFiles!.files) {
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
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // void openFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }

  // void openFiles(List<PlatformFile> files){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FilsPage(
  //     files
  //   ))
  // )
  //}
  // Future<File> saveSelectedFile(PlatformFile file) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final newFile = File('${appStorage.path}/${file.name}');

  //   return File(file.path!).copy(newFile.path);
  // }
}
