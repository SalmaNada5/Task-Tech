import 'package:task_tech/presentation/screens/create_profile/view/screens/bio_screen.dart';
import 'package:task_tech/utils/exports.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateProfileCubit createProfileCubit =
        BlocProvider.of<CreateProfileCubit>(context);
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
                BlocBuilder<CreateProfileCubit, CreateProfileState>(
                  buildWhen: (p, c) =>
                      c is CreateProfileInitial || c is AddNewSkillChipState,
                  bloc: createProfileCubit,
                  builder: (context, state) {
                    return Wrap(
                      spacing: 8,
                      children: List.generate(
                        createProfileCubit.skillsList.length,
                        (i) => FilterChipWidget(
                          chipName: createProfileCubit.skillsList[i].chipName,
                          isSelected:
                              createProfileCubit.skillsList[i].isSelected,
                          index: i,
                        ),
                      ),
                    );
                  },
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

                    controller: createProfileCubit.skillController,
                    onChanged: (value) {
                      createProfileCubit.skillController.text = value;
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
                        createProfileCubit.addNewSkillChip(value),
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
                      // for (var element in createProfileCubit.skills) {
                      //   logWarning(element);
                      // }
                      Constants.navigateTo(const BioScreen());
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

class FilterChipWidget extends StatelessWidget {
  final String chipName;
  final bool isSelected;
  final int index;
  const FilterChipWidget({
    Key? key,
    required this.chipName,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateProfileCubit createProfileCubit =
        BlocProvider.of<CreateProfileCubit>(context);
    return FilterChip(
      padding: const EdgeInsetsDirectional.all(3),
      label: BlocBuilder<CreateProfileCubit, CreateProfileState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(chipName),
              const SizedBox(
                width: 10,
              ),
              isSelected
                  ? const Icon(Icons.check,
                      color: Colors.white, size: 22, weight: 400)
                  : const Icon(Icons.add,
                      color: Color.fromRGBO(166, 166, 166, 0.8),
                      size: 22,
                      weight: 400)
            ],
          );
        },
      ),
      selected: isSelected,
      onSelected: (selected) async {
        //if (isSelected) widget.skillList!.add(widget.chipName);
        createProfileCubit.onSkillChipSelected(selected, index);
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
