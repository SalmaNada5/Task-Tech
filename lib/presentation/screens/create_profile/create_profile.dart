import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_controller/profile_controller.dart';
import 'package:task_tech/presentation/screens/create_profile/profile_controller/profile_model.dart';
import 'package:task_tech/presentation/screens/create_profile/widgets/app_bar_widget.dart';
import 'package:task_tech/presentation/screens/create_profile/widgets/default_form_field.dart';

import 'package:geolocator/geolocator.dart';

import '../../../constants/consts.dart';

///////////////

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  File? _image;
  AssetImage image = const AssetImage('images/picture.png');
  String? gender;
  String imagepath = "";
  late File imagefile;
  final _picker = ImagePicker();

  late GoogleMapController mapController;

  // ignore: unused_field
  String? _currentAddress;
  Position? _currentPosition;
   late AnimationController controller;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
 // final LatLng _center = const LatLng(45.521563, -122.677433);


  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future cropImage() async {
    CroppedFile? croppedfile = await ImageCropper().cropImage(
      sourcePath: imagepath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        WebUiSettings(
          context: context,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var dateController = TextEditingController();
    var ageController = TextEditingController();
    var locationController = TextEditingController();
    var phoneController = TextEditingController();
    var genderController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    List<String> list = <String>['Male', 'Female'];

  

    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(percent: 20),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width * 0.03,
              end: MediaQuery.of(context).size.width * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03,
              top: MediaQuery.of(context).size.height * 0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey[600],
                    backgroundImage:
                        _image != null ? FileImage(_image!, scale: 0.5) : null,
      
                    //image,
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
                    onPressed: _openImagePicker
                    //selectFile();
                    ,
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
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: primaryLightColor,
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
                        Text(
                          'Name *',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validate: (value) {
                              value = nameController.text;
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
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
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
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
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
                                  child:
                                          DropdownButton<String>(
                                        underline:
                                            Container(), //remove underline
                                        borderRadius:
                                            BorderRadius.circular(8.6),
                                        alignment: AlignmentDirectional.center,
                                        isExpanded: true,
                                        icon:   const Icon(
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
                                            gender = value!;
                                            //dropDownValue;
                                            debugPrint(gender);
                                          });
                                        })
                                        ,) ,
                                   
                                     
                                  
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
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DefaultFormField(
                                      controller: ageController,
                                      type: TextInputType.number,
                                      validate: (value) {
                                        value = ageController.text;
                                        if (value.isEmpty) {
                                          return 'Age must not be empty';
                                        } else {
                                          return null;
                                        }
                                      }),
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
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: locationController,
                            type: TextInputType.text,
                            suffix: IconButton(
                                onPressed: _getCurrentPosition,
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
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: phoneController,
                            type: TextInputType.text,
                            validate: (value) {
                              value = phoneController.text;
                              if (value.isEmpty && value.length < 11) {
                                return 'Phone is too short ';
                              } else {
                                return null;
                              }
                            }),
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
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    CreateProfileModel? profileModel;
                                    profileModel = await ProfileController.createProfileFunc(
                                      birthDate: dateController.text,
                                      age: ageController.text,
                                      gender: gender,
                                      location: locationController.text,
                                      phoneNumber: phoneController.text

                                    );
                                   /* if (profileModel == null) {
                                return Constants.errorMessage(
                                    description: 'Invalid email or password!');
                              } else {
                                 SharedPreferences pref =await SharedPreferences.getInstance();
                                 pref.setString("email", emailController.text);
                                return Constants.navigateTo(const SkillsScreen(),
                                    pushAndRemoveUntil: true);
                              }*/
                                 
                                  }
                                },
                                child: Text(
                                  'Next',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20, color: Colors.white),
                                )),
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
