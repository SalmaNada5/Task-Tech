import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_screen.dart';

import '../../../constants/colors.dart';
import 'app_bar_widget.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  EducationScreenState createState() => EducationScreenState();
}

class EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(percent: 100),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                 EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * 0.03,
            end: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03,
            top: MediaQuery.of(context).size.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Add your education here',
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 19,
                ),
                 Text(
                  'if you don’t have a degree, adding any\n'
                  'relevant education helps make your profile'
                  ' visible.',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(58, 51, 53, 1)),
                ),
                const SizedBox(
                  height: 34,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(22, 80, 105, 0.21),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              PlatformFile file = result.files.first;

                              debugPrint(file.name);
                              debugPrint(file.bytes.toString());
                              debugPrint(file.size.toString());
                              debugPrint(file.extension);
                              debugPrint(file.path);
                            } else {
                              // User canceled the picker
                            }
                          },
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
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: primaryLightColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                 Text(
                  'Upload cv/ resume .',
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 27,
                ),
                DottedBorder(
                  dashPattern: const [8, 6],
                  borderType: BorderType.Rect,
                  radius: const Radius.circular(8),
                  strokeWidth: 1,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                  child: Container(
                    width: double.infinity,
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(245, 245, 245, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset('icons/upload.png'),
                          iconSize: 40,
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              PlatformFile file = result.files.first;

                              debugPrint(file.name);
                              debugPrint(file.bytes.toString());
                              debugPrint(file.size.toString());
                              debugPrint(file.extension);
                              debugPrint(file.path);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                         Text(
                          'Browse file',
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(124, 124, 124, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                                  builder: (context) => const ProfileScreen()));
                        },
                        child:  Text(
                          'Save',
                          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                        )),
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
