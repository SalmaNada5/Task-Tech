import 'dart:core';
import 'package:task_tech/utils/exports.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    CreateProfileCubit createProfileCubit =
        BlocProvider.of<CreateProfileCubit>(context);
    TextStyle? labelTextTheme = GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.headlineSmall!.color);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: myAppbar(percent: 20),
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
                  height: 5,
                ),
                Center(
                  child: CircleAvatar(
                      radius: Constants.screenWidth * 0.12,
                      backgroundColor: Colors.grey[600],
                      child:
                          BlocBuilder<CreateProfileCubit, CreateProfileState>(
                        bloc: createProfileCubit,
                        // buildWhen: (previous, current) =>
                        //     current is UploadProfilePhotoPressedState ||
                        //     current is CreateProfileInitial,
                        builder: (context, state) {
                          return ClipOval(
                            child: createProfileCubit.imagefile != null
                                ? Image.file(
                                    createProfileCubit.imagefile!,
                                    scale: 0.5,
                                    fit: BoxFit.cover,
                                    width: Constants.screenWidth * 0.5,
                                    height: Constants.screenWidth * 0.5,
                                  )
                                : Image.asset(
                                    'images/default person.png',
                                    fit: BoxFit.cover,
                                  ),
                          );
                        },
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                  height: 50,
                  width: Constants.screenWidth * 0.9,
                  color: const Color.fromRGBO(22, 80, 105, 0.21),
                  onpressed: () {
                    createProfileCubit.onUploadProfilePhotoPressed();
                  },
                  childWidget: Row(
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
                        'Upload photo',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: createProfileCubit.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Job Name',
                        style: labelTextTheme,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultFormField(
                          controller: createProfileCubit.jobController,
                          type: TextInputType.text,
                          validate: (value) {
                            value = createProfileCubit.jobController.text;
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
                        style: labelTextTheme,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<CreateProfileCubit, CreateProfileState>(
                        builder: (context, state) {
                          return BlocBuilder<CreateProfileCubit,
                              CreateProfileState>(
                            builder: (context, state) {
                              return DefaultFormField(
                                controller: createProfileCubit.dateController,
                                type: TextInputType.datetime,
                                suffix: IconButton(
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate:
                                                  DateTime.parse('2030-12-12'))
                                          .then((value) {
                                        createProfileCubit
                                            .onDateSelected(value);
                                      });
                                    },
                                    icon: const Icon(
                                        Icons.calendar_today_outlined)),
                                validate: (value) {
                                  value =
                                      createProfileCubit.dateController.text;
                                  if (value.isEmpty) {
                                    return 'Birth date must not be empty';
                                  } else {
                                    return null;
                                  }
                                },
                              );
                            },
                          );
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
                                  style: labelTextTheme,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: Constants.screenWidth * 0.5,
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 12, end: 12),
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.6),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            227, 227, 227, 1),
                                        style: BorderStyle.solid),
                                  ),
                                  child: BlocBuilder<CreateProfileCubit,
                                      CreateProfileState>(
                                    builder: (context, state) {
                                      return DropdownButton<String>(
                                          dropdownColor:
                                              Theme.of(context).primaryColor,
                                          underline:
                                              Container(), //remove underline
                                          borderRadius:
                                              BorderRadius.circular(8.6),
                                          alignment:
                                              AlignmentDirectional.center,
                                          isExpanded: true,
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            size: 20,
                                            color: Color.fromRGBO(
                                                197, 197, 197, 1),
                                          ),
                                          items: createProfileCubit.gendersList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(fontSize: 16),
                                              ),
                                            );
                                          }).toList(),
                                          value: createProfileCubit.gender,
                                          onChanged: (String? value) {
                                            createProfileCubit
                                                .onGenderSelected(value!);
                                          });
                                    },
                                  ),
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
                                  style: labelTextTheme,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DefaultFormField(
                                  controller: createProfileCubit.ageController,
                                  type: const TextInputType.numberWithOptions(
                                      decimal: false, signed: false),
                                  validate: (value) {
                                    value =
                                        createProfileCubit.ageController.text;
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
                        style: labelTextTheme,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultFormField(
                          controller: createProfileCubit.locationController,
                          type: TextInputType.text,
                          suffix: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.location_on_outlined)),
                          validate: (value) {
                            value = createProfileCubit.locationController.text;

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
                        style: labelTextTheme,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultFormField(
                          controller: createProfileCubit.phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            value = createProfileCubit.phoneController.text;
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
                          //color: Theme.of(context).primaryColor,
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
                            if (createProfileCubit.formKey.currentState!
                                .validate()) {
                              logInfo(
                                  'job: ${createProfileCubit.jobController.text}');
                              Constants.navigateTo(const SkillsScreen(),
                                  pushAndRemoveUntil: true);
                            }
                          },
                          childWidget: Text(
                            'Next',
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
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
