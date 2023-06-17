import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/add_post/reusable_form.dart';

import '../../../constants/text_styles.dart';

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
            style: fieldTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _descriptionController,
            style: fieldTextStyle,
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
            style: fieldTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _attachFileController,
            style: fieldTextStyle,
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
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xffC0C0C0),
                )),
            onChanged: (value) {
              _attachFileController.text = value.toString();
              _attachFileController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _attachFileController.text.length));
            },
            validator: (value) {
              value = _attachFileController.text;
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
        ],
      ),
    );
  }
}
