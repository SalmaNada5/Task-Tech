

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_tech/presentation/create_profile/appBarWidget.dart';

import '../../constants/colors.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MyAppbar(percent: 100),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
                right:15,
                left: 15,
                bottom: 20,
                top: 34

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add your education here',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),),
                SizedBox(height: 19,),
                Text('if you don’t have a degree, adding any\n'
                    'relevant education helps make your profile'
                    ' visible.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(58, 51, 53, 1)
                  ),),
                SizedBox(height: 34,),
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
                          'Add Education',
                          style: TextStyle(fontSize: 20, color: primaryLightColor,fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 66,),
                Text('Upload cv/ resume .',
                  style:TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ) ,),
                SizedBox(height: 27,),
                DottedBorder(
                  dashPattern: [8,6],
                  borderType: BorderType.Rect,
                  radius: Radius.circular(8),
                  strokeWidth: 1,
                  color: Color.fromRGBO(124, 124, 124, 1),
                  child: Container(
                    width: double.infinity,
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                      color: Color.fromRGBO(245, 245, 245, 1),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset('icons/upload.png'),
                          iconSize: 40,
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles();

                            if (result != null) {
                              PlatformFile file = result.files.first;

                              print(file.name);
                              print(file.bytes);
                              print(file.size);
                              print(file.extension);
                              print(file.path);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                        Text('Browse file',
                          style: TextStyle(
                              color: Color.fromRGBO(124, 124, 124, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                          ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 122,),
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
            ),
          ),
        ),
      ),
    );
  }
}
