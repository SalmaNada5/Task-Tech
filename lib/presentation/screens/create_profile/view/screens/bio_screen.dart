import 'package:task_tech/utils/exports.dart';

class BioScreen extends StatelessWidget {
  const BioScreen({
    Key? key,
    this.job,
    this.birthDate,
    this.gender,
    this.age,
    this.location,
    this.phoneNumber,
    this.skills,
  }) : super(key: key);
  final String? job;
  final String? birthDate;
  final String? gender;
  final String? age;
  final String? location;
  final String? phoneNumber;
  final List<String>? skills;

  @override
  Widget build(BuildContext context) {
    CreateProfileCubit createProfileCubit =
        BlocProvider.of<CreateProfileCubit>(context);
    return Scaffold(
      appBar: myAppbar(percent: 60),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: Constants.screenWidth * 0.03,
            end: Constants.screenWidth * 0.03,
            bottom: Constants.screenHeight * 0.03,
            top: Constants.screenHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Write a bio to tell the world \n'
                'about yourself .',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.headlineSmall!.color),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Help people get to know you at a glance .\n'
                'what work are you best at ? Tell them clearly, using paragraphs or bullet points.\n'
                'you can always edit later !',
                maxLines: 4,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.headlineSmall!.color),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: const Color.fromRGBO(218, 218, 218, 1),
              ),
              SizedBox(
                height: Constants.screenHeight * 0.06,
              ),
              Center(
                child: SizedBox(
                  width: Constants.screenWidth * 0.9,
                  height: Constants.screenWidth * 0.4,
                  child: TextFormField(
                    controller: createProfileCubit.descriptionController,
                    onChanged: (value) {
                      createProfileCubit.descriptionController.text =
                          value.toString();
                      createProfileCubit.descriptionController.selection =
                          TextSelection.collapsed(
                              offset: createProfileCubit
                                  .descriptionController.text.length);
                    },
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintMaxLines: 3,
                      hintText:
                          'Describe your top skills, experiences, and interests. This is one of the first things clients will see on your profile.',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color:
                              Theme.of(context).textTheme.headlineSmall!.color),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(218, 218, 218, 1),
                            width: 1,
                          )),
                      contentPadding: EdgeInsetsDirectional.only(
                          start: Constants.screenWidth * 0.027,
                          end: Constants.screenWidth * 0.027,
                          top: Constants.screenWidth * 0.027,
                          bottom: Constants.screenWidth * 0.027),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'At least 100 characters',
                style: GoogleFonts.poppins(
                    color: Theme.of(context).textTheme.headlineSmall!.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: Constants.screenHeight * 0.06,
              ),
              Center(
                child: CustomButtonWidget(
                    width: Constants.screenWidth * 0.7,
                    height: Constants.screenHeight * 0.075,
                    onpressed: () async {
                      logWarning(
                          'desc: ${createProfileCubit.descriptionController.text}');
                      Constants.navigateTo(SalaryScreen(
                        age: age,
                        job: job,
                        birthDate: birthDate,
                        gender: gender,
                        location: location,
                        phoneNumber: phoneNumber,
                        skills: skills,
                        description:
                            createProfileCubit.descriptionController.text,
                      ));
                    },
                    childWidget: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: CustomButtonWidget(
                    width: Constants.screenWidth * 0.7,
                    height: Constants.screenHeight * 0.075,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderColor: const Color.fromRGBO(22, 80, 105, 1),
                    onpressed: () {
                      Constants.navigateTo(EducationScreen(
                        job: job,
                        birthDate: birthDate,
                        gender: age,
                        location: location,
                        phoneNumber: phoneNumber,
                        skills: skills,
                      ));
                    },
                    childWidget: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
