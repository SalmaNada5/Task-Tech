<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/skills_screen.dart';

import 'appBarWidget.dart';
=======
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:task_tech/constants/colors.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
>>>>>>> 63030a3b91b0a55e435ea07eb3523e1620afeabb

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

<<<<<<< HEAD
  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
  }
  String? dropDownValue ;



  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var dateController = TextEditingController();
    var ageController = TextEditingController();
    var locationController = TextEditingController();
    var phoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    List<String> list = <String>['Male', 'Female'];



    return Scaffold(
       appBar: MyAppbar(percent: 20),
      body: Center(


        child: Padding(
          padding: const EdgeInsets.only(
              right:15,
              left: 15,
              bottom: 20
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: CircleAvatar(

                    radius: 65,
                    backgroundImage: AssetImage('images/picture.png'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(22, 80, 105, 0.21),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_outlined,
                          color: primaryLightColor,
                          weight: 500,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Upload photo',
                          style: TextStyle(fontSize: 20, color: primaryLightColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name *',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          /*validate: (String? value){
                          if(value!.isEmpty || value == null)
                            return 'Name must not be empty';
                          else return null;
                        }*/
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Birth Date',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            controller: dateController,
                            type: TextInputType.datetime,
                            suffix: Icons.calendar_today_outlined,
                            /*validate: (String value){
                          if(value.isEmpty) return 'Birth date must not be empty';
                        }*/
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  initialDate:  DateTime.now(),
                                  firstDate:  DateTime.now(),
                                  lastDate: DateTime.parse('2022-12-12'))
                                  .then((value) {
                                dateController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [


                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Gender',
                                    style:
                                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.6),
                                      border: Border.all(
                                          color: const Color.fromRGBO(227, 227, 227, 1),
                                          style: BorderStyle.solid),
                                    ),
                                    child: DropdownButton<String>(


                                        underline: Container(), //remove underline
                                        borderRadius: BorderRadius.circular(8.6),
                                        alignment: AlignmentDirectional.center,
                                        isExpanded: true,
                                        items: list.map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(

                                                child: Text(
                                                  value,
                                                ),
                                                value: value,
                                              );
                                            }).toList(),
                                        icon: const Icon(Icons.keyboard_arrow_down_outlined,
                                          size: 20,

                                          color: Color.fromRGBO(197, 197, 197, 1),),
                                        value: dropDownValue,
                                        onChanged: (String? value) {


                                          setState(() {
                                            dropDownValue = value!;
                                            //dropDownValue;
                                            print(dropDownValue);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Age',
                                    style:
                                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  defaultFormField(
                                      controller: ageController,
                                      type: TextInputType.number)
                                ],
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'Location',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            controller: locationController,
                            type: TextInputType.text,
                            suffix: Icons.location_on_outlined),
                        const SizedBox(height: 10,),

                        const Text(
                          'Phone Number',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: 291,
                            height: 55,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(22, 80, 105, 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=> const Skills_Screen()));
                                },
                                child:const Text('Next',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                  ),)
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  String? label,
  IconData? suffix,
  //required Function validate,
  Function? onTap,
}) {
  return Container(
    padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
    width: double.infinity,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.6),
      border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromRGBO(227, 227, 227, 1)),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8.6)),
        ),
        labelText: label,
        suffixIcon: suffix != null ? Icon(suffix,color: const Color.fromRGBO(
            197, 197, 197, 1),) : null,
      ),
      /*validator: (s){
        validate(s);
      },*/
      onTap: onTap == null
          ? null
          : () {
              onTap();
            },
    ),
  );
}

/*
LinearProgressBar(
maxSteps: 5,
progressType: LinearProgressBar.progressTypeLinear,
//currentStep: currentStep,
progressColor: primaryLightColor,
backgroundColor: Color.fromARGB(217, 217, 217, 1),
minHeight: 10,
valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
)*/
=======

  @override
  State<CreateProfile> createState() => _CreateProfileState();
  
}

class _CreateProfileState extends State<CreateProfile> {

late AnimationController controller;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 70,
        backgroundColor: white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context){
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                  onPressed: (){},
                  icon: Image.asset('icons/profile.png')),
            );
          },
        ) ,
          title: const Padding(
            padding:  EdgeInsets.all(60.0),
            child: Text(
              'Create Profile',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black
              ),
            ),
          ),


      ),
      body: Column(
        children: [
         RoundedProgressBar(
           height: 12,
           style: RoundedProgressBarStyle(
             widthShadow: 0,
             borderWidth: 0,
             colorProgress: primaryLightColor,
             backgroundProgress: Colors.grey
           ),
         )

        ],
      ),
    );
  }
}
>>>>>>> 63030a3b91b0a55e435ea07eb3523e1620afeabb
