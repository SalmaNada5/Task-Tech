import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_bar_widget.dart';
import 'education_screen.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  SalaryScreenState createState() => SalaryScreenState();
}

class SalaryScreenState extends State<SalaryScreen> {
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
  List<String> frequencyList = <String>['per month', 'per hour', 'per task'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style:  GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(124, 124, 124, 1)),
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(
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
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(124, 124, 124, 1)),
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(
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
                  child: Container(
                    width: 345,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 80, 105, 1),
                      borderRadius: BorderRadius.circular(7.7),
                    ),
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EducationScreen()));
                        },
                        child:  Text(
                          'Next',
                          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
