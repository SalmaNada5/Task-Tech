import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/app_bar_widget.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/button_widget.dart';

import 'education_screen.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen(
      {Key? key,
      this.job,
      this.birthDate,
      this.gender,
      this.age,
      this.location,
      this.phoneNumber,
      this.skills,
      this.description})
      : super(key: key);
  final String? job;
  final String? birthDate;
  final String? gender;
  final String? age;
  final String? location;
  final String? phoneNumber;
  final List<String>? skills;
  final String? description;
  @override
  SalaryScreenState createState() => SalaryScreenState();
}

class SalaryScreenState extends State<SalaryScreen> {
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController curController = TextEditingController();
  TextEditingController freqcontroller = TextEditingController();

  String? currencyValue;
  List<String> currencyList = <String>[
    'EUR',
    'GBP',
    'USD',
    'AUD',
    'CAD',
    'JPY',
    'HKD',
    'CHF',
    'SEK',
    'ILS'
  ];
  String? frequencyValue;
  List<String> frequencyList = <String>[
    'per hour',
    'per day',
    'per weak',
    'per month'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(percent: 80),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width * 0.03,
              end: MediaQuery.of(context).size.width * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03,
              top: MediaQuery.of(context).size.height * 0.03),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expected Salary',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
                Text(
                  'Minimum',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(90, 80, 80, 1)),
                ),
                const SizedBox(
                  height: 9,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: TextFormField(
                    controller: minController,
                    onChanged: (value) {
                      minController.selection = TextSelection.collapsed(
                          offset: minController.text.length);
                      minController.text = value;
                    },
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(124, 124, 124, 1)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8.6)),
                        ),
                        hintText: '2.000',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(124, 124, 124, 1))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Maximum',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(90, 80, 80, 1)),
                ),
                const SizedBox(
                  height: 9,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: TextFormField(
                    controller: maxController,
                    onChanged: (value) {
                      maxController.selection = TextSelection.collapsed(
                          offset: maxController.text.length);
                      maxController.text = value;
                    },
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(124, 124, 124, 1)),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.6)),
                      ),
                      hintText: '5.000',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(124, 124, 124, 1)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Currency',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(90, 80, 80, 1)),
                ),
                const SizedBox(
                  height: 9,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: DropdownButton<String>(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 20,
                      color: Color.fromRGBO(124, 124, 124, 1),
                    ),
                    value: currencyValue,
                    underline: Container(), //remove underline
                    borderRadius: BorderRadius.circular(8.6),
                    alignment: AlignmentDirectional.center,
                    isExpanded: true,
                    items: currencyList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                    onChanged: (String? value) {
                      setState(() {
                        currencyValue = value;
                        debugPrint(value);
                      });
                    },
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(124, 124, 124, 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Frequency',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(90, 80, 80, 1)),
                ),
                const SizedBox(
                  height: 9,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: DropdownButton<String>(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 20,
                      color: Color.fromRGBO(124, 124, 124, 1),
                    ),
                    value: frequencyValue,
                    underline: Container(), //remove underline
                    borderRadius: BorderRadius.circular(8.6),
                    alignment: AlignmentDirectional.center,
                    isExpanded: true,
                    items: frequencyList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        frequencyValue = value;
                        debugPrint(value);
                      });
                    },
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(124, 124, 124, 1)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: CustomButtonWidget(
                      width: Constants.screenWidth * 0.7,
                      height: Constants.screenHeight * 0.075,
                      color: const Color.fromRGBO(22, 80, 105, 1),
                      onpressed: () {
                        logInfo(
                            'frequency $frequencyValue , currency: $currencyValue');
                        Constants.navigateTo(EducationScreen(
                          age: widget.age,
                          job: widget.job,
                          birthDate: widget.birthDate,
                          gender: widget.gender,
                          location: widget.location,
                          phoneNumber: widget.phoneNumber,
                          skills: widget.skills,
                          description: widget.description,
                          minimum: int.parse(minController.text),
                          maximum: int.parse(maxController.text),
                          currency: currencyValue,
                          frequency: frequencyValue,
                        ));
                      },
                      childWidget: Text(
                        'Next',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      )),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
