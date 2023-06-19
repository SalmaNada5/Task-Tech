import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/create_profile/salary_screen.dart';

import 'app_bar_widget.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  BioScreenState createState() => BioScreenState();
}

class BioScreenState extends State<BioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(percent: 60),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * 0.03,
            end: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03,
            top: MediaQuery.of(context).size.height * 0.03),
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
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Describe your top skills, experiences, and\n'
                    'interests. This is one of the first things clients\n '
                    'will see on your profile.',
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
                        start: MediaQuery.of(context).size.width * 0.025,
                        end: MediaQuery.of(context).size.width * 0.025,
                        top: MediaQuery.of(context).size.width * 0.025,
                        bottom: MediaQuery.of(context).size.width * 0.025),
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
                height: MediaQuery.of(context).size.height * 0.06,
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
                                builder: (context) => const SalaryScreen()));
                      },
                      child:  Text(
                        'Next',
                        style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  width: 345,
                  height: 55,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromRGBO(22, 80, 105, 1)),
                    color: white,
                    borderRadius: BorderRadius.circular(7.7),
                  ),
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SalaryScreen()));
                      },
                      child:  Text(
                        'Skip',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: const Color.fromRGBO(22, 80, 105, 1)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
