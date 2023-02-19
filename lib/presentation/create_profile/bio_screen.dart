import 'package:flutter/material.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/create_profile/salary_screen.dart';

import 'appBarWidget.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppbar(percent: 60),
      body:Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 30, start: 15, end: 15,bottom: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget> [
              const Text(
                'Write a bio to tell the world \n'
                    'about yourself .',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              const SizedBox(height: 10,),
              const Text('Help people get to know you at a glance .\n'
                  'what work are you best at ? Tell them clearly, using paragraphs or bullet points.\n'
                  'you can always edit later !',
                maxLines: 4,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(58, 51, 53, 1)
                ),

              ),
              const SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 1,
                color: const Color.fromRGBO(218, 218, 218, 1),

              ),
              const SizedBox(height: 50,),

              Container(
                width: double.infinity,

                child: TextFormField(

                  maxLines: null,

                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                    hintText: 'Describe your top skills, experiences, and\n'
                        'interests. This is one of the first things clients\n'
                        'will see on your profile.',
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(124, 124, 124, 1)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(218, 218, 218, 1),
                          width: 1,
                        )
                    ),
                    contentPadding: const EdgeInsetsDirectional.only(
                        start: 25,
                        end: 25,
                        top: 26,
                        bottom: 26
                    ),


                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('At least 100 characters',
                style: TextStyle(
                    color: Color.fromRGBO(124, 124, 124, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),),
              const SizedBox(height: 112,),
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
                                builder: (context)=> const SalaryScreen()));
                      },
                      child:const Text('Next',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),)
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Center(
                child: Container(
                  width: 345,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(22, 80, 105, 1)
                    ),
                    color: white,
                    borderRadius: BorderRadius.circular(7.7),

                  ),
                  child: MaterialButton(

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=> const SalaryScreen()));
                      },
                      child:const Text('Skip',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(22, 80, 105, 1)
                        ),)
                  ),
                ),
              ),

            ],
          ),
        ),
      ) ,
    );
  }
}
