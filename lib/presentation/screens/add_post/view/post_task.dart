import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/add_post/view/reusable_form.dart';

import '../../../../constants/text_styles.dart';

class PostTask extends StatefulWidget {
  const PostTask({super.key});

  @override
  State<PostTask> createState() => _PostTaskState();
}

class _PostTaskState extends State<PostTask> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deliveryDaysController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _stController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ReusablePostForm(
      taskNameController: _taskNameController,
      descriptionController: _descriptionController,
      deliveryDaysController: _deliveryDaysController,
      salaryController: _salaryController,
      categoryController: _categoryController,
      stController: _stController,
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
            controller: _descriptionController,
            style: headStyle,
            decoration: InputDecoration(
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
            maxLines: 6,
            minLines: 3,
          ),
        ],
      ),
      firstLabel: 'Name of your Task',
    );
  }
}
