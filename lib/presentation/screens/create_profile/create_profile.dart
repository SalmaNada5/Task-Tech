// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/create_profile/skills_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/widgets.dart';

import 'app_bar_widget.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
  }

  String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var dateController = TextEditingController();
    var ageController = TextEditingController();
    var locationController = TextEditingController();
    var phoneController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    List<String> list = <String>['Male', 'Female'];
    FilePickerResult? result;
    String? outputFile;
    var image = const AssetImage('images/picture.png');
  /*   final Completer<GoogleMapController> mapcontroller =
        Completer<GoogleMapController>();

    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    ); */

    Completer<GoogleMapController> mapcontroller = Completer();

   const LatLng center =  LatLng(45.521563, -122.677433);

  void onMapCreated(GoogleMapController controller) {
    mapcontroller.complete(controller);
  }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(percent: 20),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: image,
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
                    onPressed: () async {
                      result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowMultiple: false,
                          allowedExtensions: ['jpg', 'png']);
                      if (result != null) {
                        List<File> files =
                            result!.paths.map((path) => File(path!)).toList();
                      } else {
                        // User canceled the picker
                      }
                      setState(() {
                        image = result as AssetImage;
                      });
                      /* outputFile = await FilePicker.platform.saveFile(
                        dialogTitle: 'Please select an output file:',
                        fileName: 'output-file.pdf',);
                       */
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
                          'Upload photo',
                          style: TextStyle(
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
                        const Text(
                          'Name *',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validate: ( value) {
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
                        const Text(
                          'Birth Date',
                          style: TextStyle(
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
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2029-12-12'))
                                    .then((value) {
                                  dateController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              icon: const Icon(Icons.calendar_today_outlined)),
                          validate: ( value) {
                            value =dateController.text;
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
                                  const Text(
                                    'Gender',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
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
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 20,
                                          color:
                                              Color.fromRGBO(197, 197, 197, 1),
                                        ),
                                        value: dropDownValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            dropDownValue = value!;
                                            //dropDownValue;
                                            debugPrint(dropDownValue);
                                          });
                                        }),
                                  ),
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
                                  const Text(
                                    'Age',
                                    style: TextStyle(
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
                        const Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFormField(
                            controller: locationController,
                            type: TextInputType.text,
                            suffix: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            content: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child:   GoogleMap(
                                                  onMapCreated: onMapCreated,
                                                  initialCameraPosition:
                                                      const CameraPosition(
                                                    target: center,
                                                    zoom: 11.0,
                                                  ),
                                                ),)
                                              
                                                /*       Positioned(
                                                    right: -40.0,
                                                    top: -40,
                                                    child: InkResponse(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: GoogleMap(
                                                        mapType: MapType.hybrid,
                                                        initialCameraPosition:
                                                            kGooglePlex,
                                                        onMapCreated:
                                                            (GoogleMapController
                                                                controller) {
                                                          mapcontroller
                                                              .complete(
                                                                  controller);
                                                        },
                                                      ),
                                                    )) */
                                              ],
                                            ),
                                          ));
                                },
                                icon: const Icon(Icons.location_on_outlined)),
                            validate: ( value) {
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
                        const Text(
                          'Phone Number',
                          style: TextStyle(
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
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SkillsScreen()));
                                  }
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
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


