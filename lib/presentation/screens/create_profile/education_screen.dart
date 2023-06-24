import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_pages/profile_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/widgets/app_bar_widget.dart';

import '../../../constants/colors.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  EducationScreenState createState() => EducationScreenState();
}

class EducationScreenState extends State<EducationScreen> {
  String? dropdownValue;
  var educationList = [
    'Ain Shams University',
    'Al Alamein International University',
    'Al-Azhar University',
    'Alexandria University',
    'Arish University',
    'Assiut University',
    'Aswan University',
    'Badr University in Cairo',
    'Benha University',
    'Beni-Suef University',
    'Cairo University',
    'Damanhour University',
    'Damietta University',
    'Delta University for Science and Technology',
    'Egyptian Chinese University',
    'Egypt-Japan University of Science and Technology',
    'Fayoum University',
    'Future University in Egypt',
    'Galala University',
    'Helwan University',
    'Kafrelsheikh University',
    'Luxor University',
    'Mansoura University',
    'Matrouh University',
    'Menoufia University',
    'Minia University',
    'Misr International University',
    'New Valley University',
    'Pharos University in Alexandria',
    'Port Said University',
    'Sinai University',
    'Sohag university',
    'South Valley University',
    'Suez Canal University',
    'Suez University',
    'Tanta University',
    'The American University in Cairo',
    'The Arab Academy for Management',
    'Banking and Financial Sciences',
    'The British University in Egypt',
    'The German University in Cairo',
    "Université Française d'Égypte",
    'University of Sadat City',
    'University of Science and Technology at Zewail City',
    'Zagazig University',
    'Massachusetts Institute of Technology (MIT)',
    'Harvard University',
    'University of Oxford',
    'University of Cambridge',
    'ETH Zurich (Swiss Federal Institute of Technology)',
    'University of Tokyo',
    'Universite PSL',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(percent: 100),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: MediaQuery.of(context).size.width * 0.03,
                end: MediaQuery.of(context).size.width * 0.03,
                bottom: MediaQuery.of(context).size.height * 0.03,
                top: MediaQuery.of(context).size.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add your education here',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w500),
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(22, 80, 105, 0.21),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButton(
                    padding: EdgeInsetsDirectional.only(
                      start: MediaQuery.of(context).size.width * 0.09,
                      end: MediaQuery.of(context).size.width *0.09
                    ),
                    value: dropdownValue,
                    isExpanded: true,
                    hint: Row(
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
                    underline: Container(),
                    icon: Container(),
              
                    items: educationList.map<DropdownMenuItem<String>>((String items) {
                      return DropdownMenuItem<String>(
                          value: items,
                          child: Text(
                            items,
                            maxLines: 2,
                            style: GoogleFonts.poppins(
                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                color:  primaryLightColor,
                                fontWeight: FontWeight.w500),
                          ));
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownValue = newvalue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'Upload cv/ resume .',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w500),
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
                        child: Text(
                          'Save',
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white),
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
