import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/Lists.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/auth/controller/cur_user_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/create_profile_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/upload_cv_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/upload_profile_photo_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/app_bar_widget.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/button_widget.dart';
import 'package:task_tech/presentation/screens/profile/view/profile_screen.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({
    Key? key,
    this.job,
    this.birthDate,
    this.gender,
    this.age,
    this.location,
    this.phoneNumber,
    this.skills,
    this.description,
    this.minimum,
    this.maximum,
    this.currency,
    this.frequency,
  }) : super(key: key);
  final String? job;
  final String? birthDate;
  final String? gender;
  final String? age;
  final String? location;
  final String? phoneNumber;
  final List<String>? skills;
  final String? description;
  final int? minimum;
  final int? maximum;
  final String? currency;
  final String? frequency;

  @override
  EducationScreenState createState() => EducationScreenState();
}

class EducationScreenState extends State<EducationScreen> {
  String? dropdownValue;
  String education = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(percent: 100),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: Constants.screenWidth * 0.03,
                end: Constants.screenWidth * 0.03,
                bottom: Constants.screenHeight * 0.03,
                top: Constants.screenHeight * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add your education here',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                      fontWeight: FontWeight.w500),
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
                    color: Theme.of(context).textTheme.headlineSmall!.color,
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                CustomButtonWidget(
                  width: Constants.screenWidth * 0.9,
                  height: Constants.screenHeight * 0.075,
                  color: const Color.fromRGBO(22, 80, 105, 0.21),
                  childWidget: DropdownButton(
                    padding: EdgeInsetsDirectional.only(
                        start: MediaQuery.of(context).size.width * 0.09,
                        end: MediaQuery.of(context).size.width * 0.09),
                    value: dropdownValue,
                    isExpanded: true,
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_outlined,
                          color: Theme.of(context).primaryColor,
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
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    underline: Container(),
                    icon: Container(),
                    items: educationList
                        .map<DropdownMenuItem<String>>((String items) {
                      return DropdownMenuItem<String>(
                          value: items,
                          child: Text(
                            items,
                            maxLines: 2,
                            style: GoogleFonts.poppins(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ));
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        education = newvalue!;
                        dropdownValue = newvalue;
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
                      fontSize: 24,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                      fontWeight: FontWeight.w500),
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
                            await UploadCVController.attachCV();
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
                  child: CustomButtonWidget(
                      width: Constants.screenWidth * 0.7,
                      height: Constants.screenHeight * 0.075,
                      onpressed: () async {
                        logInfo(
                            'Date sent => ${widget.gender}, ${widget.frequency}, ${widget.age}, ${widget.birthDate} , ${widget.currency}, , ${widget.description}, ${widget.job}, ${widget.location}');
                        await UploadProfilePhotoController
                            .uploadProfilePhotoFunc();
                        await UploadCVController.uploadCVFunc();
                        await CreateProfileController.createProfileFunc(
                          about: widget.description ?? '',
                          minimum: widget.minimum ?? 0,
                          maximum: widget.maximum ?? 0,
                          currency: widget.currency ?? '',
                          frequency: widget.frequency ?? '',
                          job: widget.job ?? '',
                          phoneNumber: widget.phoneNumber ?? '',
                          gender: widget.gender ?? '',
                          age: widget.age ?? '',
                          birthDate: widget.birthDate ?? '',
                          location: widget.location ?? '',
                          skills: widget.skills ?? [],
                          education: education,
                        );
                        await CurrentUserInfoController.getUserInfoFunc();
                        Constants.navigateTo(const ProfileScreen(
                          isMe: true,
                        ));
                      },
                      childWidget: Text(
                        'Save',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
