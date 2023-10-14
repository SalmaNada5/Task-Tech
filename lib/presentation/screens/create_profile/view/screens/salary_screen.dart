import 'package:task_tech/utils/exports.dart';

class SalaryScreen extends StatelessWidget {
  const SalaryScreen({
    Key? key,
    this.job,
    this.birthDate,
    this.gender,
    this.age,
    this.location,
    this.phoneNumber,
    this.skills,
    this.description,
  }) : super(key: key);
  final String? job;
  final String? birthDate;
  final String? gender;
  final String? age;
  final String? location;
  final String? phoneNumber;
  final List<String>? skills;
  final String? description;
  @override
  @override
  Widget build(BuildContext context) {
    CreateProfileCubit createProfileCubit =
        BlocProvider.of<CreateProfileCubit>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: myAppbar(percent: 80),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width * 0.03,
              end: MediaQuery.of(context).size.width * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03,
              top: MediaQuery.of(context).size.height * 0.03),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expected Salary',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Text(
                    'Minimum',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  // Container(
                  //   padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                  //   width: double.infinity,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: const Color.fromRGBO(245, 245, 245, 1),
                  //   ),
                  //   child: TextFormField(
                  //     controller: minController,
                  //     onChanged: (value) {
                  //       minController.selection = TextSelection.collapsed(
                  //           offset: minController.text.length);
                  //       minController.text = value;
                  //     },
                  //     style: GoogleFonts.poppins(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w400,
                  //         color: const Color.fromRGBO(124, 124, 124, 1)),
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //         border: const OutlineInputBorder(
                  //           borderSide: BorderSide.none,
                  //           borderRadius: BorderRadius.all(Radius.circular(8.6)),
                  //         ),
                  //         hintText: '200',
                  //         hintStyle: GoogleFonts.poppins(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             color: const Color.fromRGBO(124, 124, 124, 1))),
                  //   ),
                  // ),
                  CustomTextFormField(
                    controller: createProfileCubit.minSalaryController,
                    fillColor: Theme.of(context).canvasColor,
                    borderColor: Theme.of(context).canvasColor,
                    obscure: false,
                    validator: (value) {
                      value = createProfileCubit.minSalaryController.text;
                      if (value.isEmpty) {
                        return 'Please fill this field';
                      } else {
                        return '';
                      }
                    },
                    hintText: '2.000',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Maximum',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomTextFormField(
                    controller: createProfileCubit.maxSalaryController,
                    fillColor: Theme.of(context).canvasColor,
                    obscure: false,
                    validator: (value) {
                      value = createProfileCubit.maxSalaryController.text;
                      if (value.isEmpty) {
                        return 'Please fill this field';
                      } else {
                        return '';
                      }
                    },
                    hintText: '2.000',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Currency',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).canvasColor),
                    child: BlocBuilder<CreateProfileCubit, CreateProfileState>(
                      builder: (context, state) {
                        return DropdownButton<String>(
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 20,
                            color: Color.fromRGBO(124, 124, 124, 1),
                          ),
                          value: createProfileCubit.currencyValue,
                          underline: const SizedBox.shrink(), //remove underline
                          borderRadius: BorderRadius.circular(8.6),
                          alignment: AlignmentDirectional.center,
                          isExpanded: true,
                          items:createProfileCubit. currencyList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            createProfileCubit.onCurrencySelected(value);
                          },
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(124, 124, 124, 1)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Frequency',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).canvasColor,
                    ),
                    child: BlocBuilder<CreateProfileCubit, CreateProfileState>(
                      builder: (context, state) {
                        return DropdownButton<String>(
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 20,
                            color: Color.fromRGBO(124, 124, 124, 1),
                          ),
                          value: createProfileCubit.frequencyValue,
                          underline: const SizedBox.shrink(), //remove underline
                          borderRadius: BorderRadius.circular(8.6),
                          alignment: AlignmentDirectional.center,
                          isExpanded: true,
                          items:createProfileCubit. frequencyList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            createProfileCubit.onFrequencySelected(value);
                          },
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(124, 124, 124, 1)),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Center(
                    child: CustomButtonWidget(
                      width: Constants.screenWidth * 0.7,
                      height: Constants.screenHeight * 0.075,
                      color: Theme.of(context).primaryColor,
                      onpressed: () {
                        logInfo('desc $description , job: $job');
                        Constants.navigateTo(EducationScreen(
                          age: age,
                          job: job,
                          birthDate: birthDate,
                          gender: gender,
                          location: location,
                          phoneNumber: phoneNumber,
                          skills: skills,
                          description: description,
                          minimum: int.parse(
                              createProfileCubit.minSalaryController.text),
                          maximum: int.parse(
                              createProfileCubit.maxSalaryController.text),
                          currency: createProfileCubit.currencyValue,
                          frequency: createProfileCubit.frequencyValue,
                        ));
                      },
                      childWidget: Text(
                        'Next',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
