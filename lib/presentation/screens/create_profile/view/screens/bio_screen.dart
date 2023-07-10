import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/create_profile/view/screens/education_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/view/screens/salary_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/app_bar_widget.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/button_widget.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({
    Key? key,
    this.job,
    this.birthDate,
    this.gender,
    this.age,
    this.location,
    this.phoneNumber,
    this.skills,
  }) : super(key: key);
  final String? job;
  final String? birthDate;
  final String? gender;
  final String? age;
  final String? location;
  final String? phoneNumber;
  final List<String>? skills;
  @override
  BioScreenState createState() => BioScreenState();
}

class BioScreenState extends State<BioScreen> {
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(percent: 60),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: Constants.screenWidth * 0.03,
            end: Constants.screenWidth * 0.03,
            bottom: Constants.screenHeight * 0.03,
            top: Constants.screenHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Write a bio to tell the world \n'
                'about yourself .',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 1)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Help people get to know you at a glance .\n'
                'what work are you best at ? Tell them clearly, using paragraphs or bullet points.\n'
                'you can always edit later !',
                maxLines: 4,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(58, 51, 53, 1)),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: const Color.fromRGBO(218, 218, 218, 1),
              ),
              SizedBox(
                height: Constants.screenHeight * 0.06,
              ),
              Center(
                child: SizedBox(
                  width: Constants.screenWidth * 0.9,
                  height: Constants.screenWidth * 0.4,
                  child: TextFormField(
                    controller: descController,
                    onChanged: (value) {
                      descController.text = value.toString();
                      descController.selection = TextSelection.collapsed(
                          offset: descController.text.length);
                    },
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintMaxLines: 3,
                      hintText:
                          'Describe your top skills, experiences, and interests. This is one of the first things clients will see on your profile.',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(124, 124, 124, 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(218, 218, 218, 1),
                            width: 1,
                          )),
                      contentPadding: EdgeInsetsDirectional.only(
                          start: Constants.screenWidth * 0.027,
                          end: Constants.screenWidth * 0.027,
                          top: Constants.screenWidth * 0.027,
                          bottom: Constants.screenWidth * 0.027),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'At least 100 characters',
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(124, 124, 124, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: Constants.screenHeight * 0.06,
              ),
              Center(
                child: CustomButtonWidget(
                    width: Constants.screenWidth * 0.7,
                    height: Constants.screenHeight * 0.075,
                    color: const Color.fromRGBO(22, 80, 105, 1),
                    onpressed: () async {
                      logWarning('desc: ${descController.text}');
                      Constants.navigateTo(SalaryScreen(
                        age: widget.age,
                        job: widget.job,
                        birthDate: widget.birthDate,
                        gender: widget.gender,
                        location: widget.location,
                        phoneNumber: widget.phoneNumber,
                        skills: widget.skills,
                        description: descController.text,
                      ));
                    },
                    childWidget: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: CustomButtonWidget(
                    width: Constants.screenWidth * 0.7,
                    height: Constants.screenHeight * 0.075,
                    color: white,
                    borderColor: const Color.fromRGBO(22, 80, 105, 1),
                    onpressed: () {
                      Constants.navigateTo(EducationScreen(
                        job: widget.job,
                        birthDate: widget.birthDate,
                        gender: widget.age,
                        location: widget.location,
                        phoneNumber: widget.phoneNumber,
                        skills: widget.skills,
                      ));
                    },
                    childWidget: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color.fromRGBO(22, 80, 105, 1)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
