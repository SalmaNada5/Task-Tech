import 'package:task_tech/utils/exports.dart';

class EducationScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    CreateProfileCubit createProfileCubit =
        BlocProvider.of<CreateProfileCubit>(context);
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
                BlocBuilder<CreateProfileCubit, CreateProfileState>(
                  bloc: createProfileCubit,
                  // buildWhen: (previous, current) => current is OnEducationSelectedState || current is CreateProfileInitial,
                  builder: (context, state) {
                    return CustomButtonWidget(
                      width: Constants.screenWidth * 0.9,
                      height: Constants.screenHeight * 0.075,
                      color: const Color.fromRGBO(22, 80, 105, 0.21),
                      childWidget: DropdownButton(
                        padding: EdgeInsetsDirectional.only(
                            start: MediaQuery.of(context).size.width * 0.09,
                            end: MediaQuery.of(context).size.width * 0.09),
                        value: createProfileCubit.dropdownValue,
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
                        items:createProfileCubit.educationList
                            .map<DropdownMenuItem<String>>((String items) {
                          return DropdownMenuItem<String>(
                              value: items,
                              child: Text(
                                items,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500),
                              ));
                        }).toList(),
                        onChanged: (String? newvalue) {
                          createProfileCubit.onEducationSelected(newvalue);
                        },
                      ),
                    );
                  },
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
                        ),
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
                            'Date sent => $gender, $frequency, $age, $birthDate , $currency, , $description, $job, $location}');
                        await UploadProfilePhotoController
                            .uploadProfilePhotoFunc();
                        await UploadCVController.uploadCVFunc();
                        createProfileCubit.createProfileCubit(
                          about: description ?? '',
                          minimum: minimum ?? 0,
                          maximum: maximum ?? 0,
                          currency: currency ?? '',
                          frequency: frequency ?? '',
                          job: job ?? '',
                          phoneNumber: phoneNumber ?? '',
                          gender: gender ?? '',
                          age: age ?? '',
                          birthDate: birthDate ?? '',
                          location: location ?? '',
                          skills: skills ?? [],
                          education: createProfileCubit.education,
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
