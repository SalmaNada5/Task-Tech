import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/text_styles.dart';

class ReusablePostForm extends StatefulWidget {
  const ReusablePostForm(
      {super.key,
      required this.taskNameController,
      required this.descriptionController,
      required this.deliveryDaysController,
      required this.salaryController,
      required this.categoryController,
      required this.stController,
      required this.difFields,
      required this.firstLabel});
  final TextEditingController taskNameController;
  final TextEditingController descriptionController;
  final TextEditingController deliveryDaysController;
  final TextEditingController salaryController;
  final TextEditingController categoryController;
  final TextEditingController stController;
  final Widget difFields;
  final String firstLabel;

  @override
  State<ReusablePostForm> createState() => _ReusablePostFormState();
}

class _ReusablePostFormState extends State<ReusablePostForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.firstLabel,
                textAlign: TextAlign.center,
                style: fieldTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.taskNameController,
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
                  widget.taskNameController.text = value.toString();
                  widget.taskNameController.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: widget.taskNameController.text.length));
                },
                validator: (value) {
                  value = widget.taskNameController.text;
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
              widget.difFields,
              const SizedBox(
                height: 10,
              ),
              Text(
                'Delivery Days',
                textAlign: TextAlign.center,
                style: fieldTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.deliveryDaysController,
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
                  widget.deliveryDaysController.text = value.toString();
                  widget.deliveryDaysController.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: widget.deliveryDaysController.text.length));
                },
                validator: (value) {
                  value = widget.deliveryDaysController.text;
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
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salary',
                        textAlign: TextAlign.center,
                        style: fieldTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 0.4 * screenW,
                        child: TextFormField(
                          controller: widget.salaryController,
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
                            widget.salaryController.text = value.toString();
                            widget.salaryController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset:
                                        widget.salaryController.text.length));
                          },
                          validator: (value) {
                            value = widget.salaryController.text;
                            if (value.isEmpty) {
                              return 'Please fill this field';
                            } else {
                              return '';
                            }
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
                        style: fieldTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 0.4 * screenW,
                        child: TextFormField(
                          controller: widget.categoryController,
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
                            widget.categoryController.text = value.toString();
                            widget.categoryController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset:
                                        widget.categoryController.text.length));
                          },
                          validator: (value) {
                            value = widget.categoryController.text;
                            if (value.isEmpty) {
                              return 'Please fill this field';
                            } else {
                              return '';
                            }
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
                style: fieldTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.stController,
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
                  widget.stController.text = value.toString();
                  widget.stController.selection = TextSelection.fromPosition(
                      TextPosition(offset: widget.stController.text.length));
                },
                validator: (value) {
                  value = widget.stController.text;
                  if (value.isEmpty) {
                    return 'Please fill this field';
                  } else {
                    return '';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint('correct');
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20)),
                    backgroundColor:
                        MaterialStateProperty.all(primaryLightColor),
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
      ),
    );
  }
}
