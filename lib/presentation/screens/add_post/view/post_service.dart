import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_tech/presentation/screens/add_post/view/reusable_form.dart';

import '../../../../constants/text_styles.dart';

class PostService extends StatefulWidget {
  const PostService({super.key});

  @override
  State<PostService> createState() => _PostServiceState();
}

class _PostServiceState extends State<PostService> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deliveryDaysController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _stController = TextEditingController();
  final TextEditingController _attachFileController = TextEditingController();

  String? fileName;
  bool fileDisSelected = false;
  @override
  Widget build(BuildContext context) {
    return ReusablePostForm(
      
      taskNameController: _taskNameController,
      descriptionController: _descriptionController,
      deliveryDaysController: _deliveryDaysController,
      salaryController: _salaryController,
      categoryController: _categoryController,
      stController: _stController,
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
            controller: _descriptionController,
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
              _descriptionController.text = value.toString();
              _descriptionController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _descriptionController.text.length));
            },
            validator: (value) {
              value = _descriptionController.text;
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
            controller: _attachFileController,
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
                suffixIcon: IconButton(
                    onPressed: () async {
                      final result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);

                      if (result == null) return;
                      final file = result.files.first;
                      openFile(file);
                      saveSelectedFile(file);
                      setState(() {
                        fileName = file.path!.split('/').last;
                        fileDisSelected = false;
                      });
                    },
                    icon: const Icon(
                      Icons.attach_file,
                      size: 20,
                    ))),
            onChanged: (value) {
              _attachFileController.text = value.toString();
              _attachFileController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _attachFileController.text.length));
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

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  // void openFiles(List<PlatformFile> files){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FilsPage(
  //     files
  //   ))
  // )
  //}
  Future<File> saveSelectedFile(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }
}
