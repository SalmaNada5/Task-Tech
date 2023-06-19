import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/presentation/screens/create_profile/skills_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/widgets.dart';

import 'app_bar_widget.dart';

/* selectFile() async {
  FilePickerResult? file = await FilePicker.platform.pickFiles();
  if (file?.files.single.path == null) return;
  uploadFile(File(file!.files.single.path!));
}

uploadFile(File file) async {
  var multipartRequest = http.MultipartRequest('POST', Uri.parse('url'));
  var length = await file.length();
  var stream = http.ByteStream(file.openRead());
  var multipartFile =
      http.MultipartFile('name', stream, length, filename: basename(file.path));
  multipartRequest.files.add(multipartFile);
  var response = await multipartRequest.send();
  if (response.statusCode == 200) {
  }
} */

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  File? _image;
  AssetImage image = const AssetImage('images/picture.png');
  String? dropDownValue;
  String imagepath = "";
  late File imagefile;
  final _picker = ImagePicker();

  late GoogleMapController mapController;

 // final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
       // final String path = await getApplicationDocumentsDirectory().path;

// copy the file to a new path
//final File newImage = await image.copy('$path/image1.png');
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
   Future cropImage() async {
    // ignore: unused_local_variable
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
     
      );}

   

  late AnimationController controller;
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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    List<String> list = <String>['Male', 'Female'];

    /*   final Completer<GoogleMapController> mapcontroller =
        Completer<GoogleMapController>();

    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    ); */

    Completer<GoogleMapController> mapcontroller = Completer();

    const LatLng center = LatLng(45.521563, -122.677433);

    void onMapCreated(GoogleMapController controller) {
      mapcontroller.complete(controller);
    }

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
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            content: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: GoogleMap(
                                                    onMapCreated: onMapCreated,
                                                    initialCameraPosition:
                                                        const CameraPosition(
                                                      target: center,
                                                      zoom: 11.0,
                                                    ),
                                                  ),
                                                )

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
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SkillsScreen()));
                                  }
                                },
                                child:  Text(
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
