import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/create_profile/controller/upload_profile_photo_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/view/screens/skills_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/app_bar_widget.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/button_widget.dart';
import 'package:task_tech/presentation/screens/create_profile/view/widgets/default_form_field.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController jobController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> list = <String>['male', 'female'];
  String? gender;
  File? _image;
  String? age;
  //AssetImage image = const AssetImage('images/picture.png');
  String imagepath = "";
  late File imagefile;
  //final _picker = ImagePicker();

  late GoogleMapController mapController;

  // ignore: unused_field
  String? _currentAddress;
  late AnimationController controller;

  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   // UploadProfilePhotoController.selectedPhoto =
  //   //     await UploadProfilePhotoController.attachPhoto();
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(
  //         pickedImage.path,
  //       );
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(percent: 20),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: Constants.screenWidth * 0.03,
              end: Constants.screenWidth * 0.03,
              bottom: Constants.screenHeight * 0.03,
              top: Constants.screenHeight * 0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CircleAvatar(
                      radius: Constants.screenWidth * 0.17,
                      backgroundColor: Colors.grey[600],
                      child: ClipOval(
                        child: _image != null
                            ? Image.file(
                                _image!,
                                scale: 0.5,
                                fit: BoxFit.cover,
                                width: Constants.screenWidth * 0.5,
                                height: Constants.screenWidth * 0.5,
                              )
                            : Image.asset(
                                'images/default person.png',
                                fit: BoxFit.cover,
                              ),
                      )

                      //image,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                  height: Constants.screenHeight * 0.075,
                  width: Constants.screenWidth * 0.9,
                  color: const Color.fromRGBO(22, 80, 105, 0.21),
                  onpressed: () => UploadProfilePhotoController.attachPhoto(),
                  //_openImagePicker,
                  /*()async{
                    _openImagePicker;

                    ProfilePhotoModel? photoModel;
                    var photopath = _image?.path;
                    photoModel = await ProfileController.addProfilePhoto(
                         photo: photopath
                        );
                        if (photoModel == null) {
                                    return Constants.errorMessage(
                                        description: 'Invalid input data');
                                  } 
                  

                  },*/
                  childWidget: Row(
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
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
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
                        Text(
                          'Job Name',
                          style: labelFormStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: jobController,
                            type: TextInputType.text,
                            validate: (value) {
                              value = jobController.text;
                              if (value.isEmpty) {
                                return 'Name must not be empty';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Birth Date',
                          style: labelFormStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                          controller: dateController,
                          type: TextInputType.datetime,
                          suffix: IconButton(
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.parse('2030-12-12'))
                                    .then((value) {
                                  dateController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              icon: const Icon(Icons.calendar_today_outlined)),
                          validate: (value) {
                            value = dateController.text;
                            if (value.isEmpty) {
                              return 'Birth date must not be empty';
                            } else {
                              return null;
                            }
                          },
                        ),
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
                                  Text(
                                    'Gender',
                                    style: labelFormStyle,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: Constants.screenWidth * 0.5,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 12, end: 12),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.6),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              227, 227, 227, 1),
                                          style: BorderStyle.solid),
                                    ),
                                    child: DropdownButton<String>(
                                        underline:
                                            Container(), //remove underline
                                        borderRadius:
                                            BorderRadius.circular(8.6),
                                        alignment: AlignmentDirectional.center,
                                        isExpanded: true,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 20,
                                          color:
                                              Color.fromRGBO(197, 197, 197, 1),
                                        ),
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        }).toList(),
                                        value: gender,
                                        onChanged: (String? value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Age',
                                    style: labelFormStyle,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DefaultFormField(
                                    controller: ageController,
                                    type: const TextInputType.numberWithOptions(
                                        decimal: false, signed: false),
                                    validate: (value) {
                                      value = ageController.text;
                                      if (value.isEmpty) {
                                        return 'Age must not be empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Location',
                          style: labelFormStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: locationController,
                            type: TextInputType.text,
                            suffix: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.location_on_outlined)),
                            validate: (value) {
                              value = locationController.text;

                              if (value.isEmpty) {
                                return 'Location must not be empty';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Phone Number',
                          style: labelFormStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (value) {
                              value = phoneController.text;
                              if (value.isEmpty || value.length < 11) {
                                return 'Phone is too short ';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CustomButtonWidget(
                              height: Constants.screenHeight * 0.07,
                              width: Constants.screenWidth * 0.7,
                              color: const Color.fromRGBO(22, 80, 105, 1),
                              onpressed: () async {
                                // bool photoUploaded =
                                //     await UploadProfilePhotoController
                                //         .uploadProfilePhotoFunc();
                                // if (photoUploaded) {
                                //   UploadProfilePhotoController
                                //       .uploadProfilePhotoFunc();
                                // } else {
                                //   Constants.errorMessage(description: 'Please try to Upload a photo again!');
                                // }

                                if (formKey.currentState!.validate()) {
                                  logInfo('job: ${jobController.text}');
                                  Constants.navigateTo(
                                      SkillsScreen(
                                          job: jobController.text,
                                          birthDate: dateController.text,
                                          gender: gender,
                                          age: ageController.text,
                                          location: locationController.text,
                                          phoneNumber: phoneController.text),
                                      pushAndRemoveUntil: true);
                                }
                                /*CreateProfileModel? profileModel;
                                  profileModel =
                                      await ProfileController.createProfileFunc(
                                          birthDate: dateController.text,
                                          age: ageController.text,
                                          gender: gender,
                                          location: locationController.text,
                                          phoneNumber: phoneController.text);
                                  if (profileModel == null) {
                                    return Constants.errorMessage(
                                        description: 'Invalid input data');
                                  } else {
                                    SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                    pref.setString('token',profileModel.status!);
                                    pref.setString("id", ProfileController.profileModel.data!.data.id);*/
                                // }
                              },
                              childWidget: Text(
                                'Next',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.white),
                              )),
                        )
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
