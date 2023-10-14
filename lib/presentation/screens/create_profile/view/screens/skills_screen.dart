import 'package:task_tech/presentation/screens/create_profile/view/screens/bio_screen.dart';
import 'package:task_tech/utils/exports.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen(
      {Key? key,
      this.job,
      this.birthDate,
      this.gender,
      this.age,
      this.location,
      this.phoneNumber})
      : super(key: key);
  final String? job;
  final String? birthDate;
  final String? gender;
  final String? age;
  final String? location;
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    CreateProfileCubit createProfileCubit =
        BlocProvider.of<CreateProfileCubit>(context);
    var skillController = TextEditingController();
    return Scaffold(
      appBar: myAppbar(percent: 40),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: Constants.screenWidth * 0.03,
              end: Constants.screenWidth * 0.03,
              bottom: Constants.screenHeight * 0.03,
              top: Constants.screenHeight * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image:
                        const AssetImage('images/Career progress-amico 1.png'),
                    height: Constants.screenHeight * 0.4,
                  ),
                ),
                Text(
                  'Interest & Skills',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color.fromRGBO(124, 124, 124, 1)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: const Color.fromRGBO(218, 218, 218, 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                Wrap(
                  spacing: 8,
                  children: createProfileCubit.chipList,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(start: 9, end: 3),
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: const Color.fromRGBO(227, 227, 227, 1)),
                  ),
                  child: TextFormField(
                    /*onFieldSubmitted: (value){
                      setState(() {
                        chiptext =skillController.text; 
                        if (chiptext.isEmpty){
                          addchip = false;
                        } else addchip =true;
                      });
                    },
                    onSaved: (newValue) {
                      print('saved');
                    },
                    onEditingComplete: (){
                      setState(() {
                        chiptext =skillController.text;
                        if (chiptext.isEmpty){
                          addchip = false;
                        } else addchip =true;
                      });
                    },*/
                    controller: skillController,
                    onChanged: (value) {
                      //value = skillController.text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8.6)),
                        ),
                        hintText: 'Type a skill..',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(184, 184, 184, 1))),
                    onFieldSubmitted: (value) =>
                        createProfileCubit.onSkillChipSelected(value),
                    // if (value != '')
                    //   {
                    //       chipList.add(FilterChipWidget(
                    //         chipName: value,
                    //         isSelected: true,
                    //       ));

                    //   }
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomButtonWidget(
                    width: Constants.screenWidth * 0.7,
                    height: Constants.screenHeight * 0.075,
                    onpressed: () {
                      Constants.navigateTo(BioScreen(
                        job: job,
                        birthDate: birthDate,
                        age: age,
                        gender: gender,
                        location: location,
                        phoneNumber: phoneNumber,
                        skills: const ['UI/UX', 'Programming'],
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
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  final String chipName;
  final bool isSelected;
  final List<String>? skillList;
  const FilterChipWidget(
      {Key? key,
      required this.chipName,
      required this.isSelected,
      this.skillList})
      : super(key: key);

  @override
  FilterChipWidgetState createState() =>
      // ignore: no_logic_in_create_state
      FilterChipWidgetState(isSelected: isSelected);
}

class FilterChipWidgetState extends State<FilterChipWidget> {
  late Icon icon;
  bool isSelected = false;
  FilterChipWidgetState({required isSelected});
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding:
          const EdgeInsetsDirectional.only(top: 3, bottom: 3, start: 3, end: 3),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.chipName),
          SizedBox(
            width: Constants.screenWidth * 0.01,
          ),
          icon = isSelected
              ? const Icon(Icons.check,
                  color: Colors.white, size: 22, weight: 400)
              : const Icon(Icons.add,
                  color: Color.fromRGBO(166, 166, 166, 0.8),
                  size: 22,
                  weight: 400)
        ],
      ),
      selected: isSelected,
      onSelected: (selected) async {
        setState(() {
          isSelected = selected;
          //if (isSelected) widget.skillList!.add(widget.chipName);
        });
        if (isSelected) {
          // CreateProfileModel? profileModel;
          // profileModel = await ProfileController.createProfileFunc(
          //     skills: widget.skillList);
          // if (profileModel == null) {
          //   return Constants.errorMessage(description: 'Invalid input data');
          //}
          //  else {
          //   Constants.navigateTo(const SkillsScreen(),
          //       pushAndRemoveUntil: true);
          // }
        }
      },
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showCheckmark: false,
      checkmarkColor: Colors.white,
      side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(217, 217, 217, 1),
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      selectedColor: Theme.of(context).primaryColor,
      labelStyle: GoogleFonts.poppins(
        color: isSelected
            ? Colors.white
            : const Color.fromRGBO(166, 166, 166, 0.8),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
