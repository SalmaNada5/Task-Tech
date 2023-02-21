import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/themes.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deliveryDaysController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _stController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 20.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Create Post',
                style: titleTheme,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Name for your Task',
              textAlign: TextAlign.center,
              style: labelStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _taskNameController,
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
                  hintText: 'Create responsive design',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xffC0C0C0),
                  )),
              onChanged: (value) {
                _taskNameController.text = value.toString();
                _taskNameController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _taskNameController.text.length));
              },
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Tell us about your Task',
              textAlign: TextAlign.center,
              style: labelStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descriptionController,
              style: fieldTextStyle,
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
              maxLines: 6,
              minLines: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Delivery Days',
              textAlign: TextAlign.center,
              style: labelStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _deliveryDaysController,
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
                _deliveryDaysController.text = value.toString();
                _deliveryDaysController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _deliveryDaysController.text.length));
              },
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Salary',
                      textAlign: TextAlign.center,
                      style: labelStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        controller: _salaryController,
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
                          _salaryController.text = value.toString();
                          _salaryController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _salaryController.text.length));
                        },
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      textAlign: TextAlign.center,
                      style: labelStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        controller: _categoryController,
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
                          _categoryController.text = value.toString();
                          _categoryController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _categoryController.text.length));
                        },
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Software Tool',
              textAlign: TextAlign.center,
              style: labelStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _stController,
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
                _stController.text = value.toString();
                _stController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _stController.text.length));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 20)),
                  backgroundColor: MaterialStateProperty.all(primaryLightColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Text(
                  'Share',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
