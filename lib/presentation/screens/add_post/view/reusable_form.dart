import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/Lists.dart';
import 'package:task_tech/constants/text_styles.dart';

class ReusablePostForm extends StatefulWidget {
  const ReusablePostForm({
    super.key,
    required this.postNameController,
    required this.descriptionController,
    required this.deliveryDaysController,
    required this.salaryController,
    required this.categoryController,
    required this.stController,
    required this.difFields,
    required this.firstLabel,
    this.onPressed,
  });
  final TextEditingController postNameController;
  final TextEditingController descriptionController;
  final TextEditingController deliveryDaysController;
  final TextEditingController salaryController;
  final TextEditingController categoryController;
  final TextEditingController stController;
  final Widget difFields;
  final String firstLabel;
  final void Function()? onPressed;

  @override
  State<ReusablePostForm> createState() => _ReusablePostFormState();
}

class _ReusablePostFormState extends State<ReusablePostForm> {
  final _formKey = GlobalKey<FormState>();
  // DateTime _curDate = DateTime.now();
  String selectedCategory = 'Web Design';

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
                style: headStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.postNameController,
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
                  widget.postNameController.text = value.toString();
                  widget.postNameController.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: widget.postNameController.text.length));
                },
                validator: (value) {
                  value = widget.postNameController.text;
                  if (value.isEmpty) {
                    return 'Please fill this field';
                  } else {
                    return null;
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
                style: headStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.deliveryDaysController,
                //readOnly: true,
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
                  // suffixIcon: IconButton(
                  //   onPressed: () async {
                  //     DateTime? selectedDate = await showDatePicker(
                  //       context: context,
                  //       initialDate: _curDate,
                  //       firstDate: DateTime(DateTime.now().year),
                  //       lastDate: DateTime(DateTime.now().year + 20),
                  //     );

                  //     setState(() {
                  //       if (selectedDate != null) {
                  //         _curDate = selectedDate;
                  //         Constants.unFocusFunc();
                  //       } else {
                  //         debugPrint('no date selected');
                  //         Constants.unFocusFunc();
                  //       }
                  //     });
                  //   },
                  //   icon: const Icon(
                  //     Icons.calendar_today_outlined,
                  //     color: Colors.grey,
                  //     size: 18,
                  //   ),
                  // ),

                  //hintText: DateFormat.yMd().format(_curDate),
                  // hintStyle: GoogleFonts.poppins(
                  //   fontSize: 16,
                  //   color: const Color.fromARGB(255, 15, 14, 14),
                  // ),
                ),
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
                    return null;
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
                        style: headStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 0.4 * screenW,
                        child: TextFormField(
                          controller: widget.salaryController,
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
                              return null;
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
                        style: headStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 0.4 * screenW,
                        child: TextFormField(
                          controller: widget.categoryController,
                          readOnly: true,
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
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DropdownButton<String>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 25,
                                  color: Color.fromRGBO(124, 124, 124, 1),
                                ),
                                value: selectedCategory,
                                underline: const SizedBox(),
                                borderRadius: BorderRadius.circular(8.6),
                                alignment: AlignmentDirectional.center,
                                isExpanded: true,
                                items: categories.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedCategory = value ?? '';
                                    widget.categoryController.text =
                                        value ?? '';
                                  });
                                },
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(124, 124, 124, 1)),
                              ),
                            ),
                          ),
                          // onChanged: (value) {
                          //   widget.categoryController.text = value.toString();
                          //   logWarning(
                          //       'caatttt ${widget.categoryController.text}');
                          //   widget.categoryController.selection =
                          //       TextSelection.fromPosition(TextPosition(
                          //           offset:
                          //               widget.categoryController.text.length));
                          // },
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
                style: headStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.stController,
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
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('correct');
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 8,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).primaryColor),
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
