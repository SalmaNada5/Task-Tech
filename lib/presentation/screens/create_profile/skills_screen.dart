import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';

import 'app_bar_widget.dart';
import 'bio_screen.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  SkillsScreenState createState() => SkillsScreenState();
}

class SkillsScreenState extends State<SkillsScreen> {
  List<Widget> chipList = [
    const FilterChipWidget(
      chipName: 'UI/UX',
      isSelected: false,
    ),
    const FilterChipWidget(
      chipName: 'Technology',
      isSelected: false,
    ),
    const FilterChipWidget(
      chipName: 'Strategy',
      isSelected: false,
    ),
    const FilterChipWidget(
      chipName: 'Interfaces',
      isSelected: false,
    ),
    const FilterChipWidget(
      chipName: 'Programming',
      isSelected: false,
    ),
    const FilterChipWidget(
      chipName: 'Writing',
      isSelected: false,
    ),
    const FilterChipWidget(
      chipName: 'Web design',
      isSelected: false,
    ),
    const FilterChipWidget(
      chipName: 'Art & illustration',
      isSelected: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    String? chiptext;
    var skillController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(percent: 40),
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
                  children: chipList,
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
                    color: const Color.fromRGBO(245, 245, 245, 1),
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: const Color.fromRGBO(227, 227, 227, 1)),
                  ),
                  child: TextFormField(
                    controller: skillController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8.6)),
                        ),
                        labelText: chiptext,
                        hintText: 'Type a skill..',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(184, 184, 184, 1))),
                    onFieldSubmitted: (value) => {
                      if (value != '')
                        {
                          setState(() {
                            chipList.add(FilterChipWidget(
                              chipName: value,
                              isSelected: true,
                            ));
                          }),
                        }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 2, horizontal: Constants.screenWidth * 0.3),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 80, 105, 1),
                      borderRadius: BorderRadius.circular(7.7),
                    ),
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BioScreen()));
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white),
                        )),
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
  const FilterChipWidget(
      {Key? key, required this.chipName, required this.isSelected})
      : super(key: key);

  @override
  FilterChipWidgetState createState() =>
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
              ? Icon(Icons.check, color: white, size: 22, weight: 400)
              : const Icon(Icons.add,
                  color: Color.fromRGBO(166, 166, 166, 0.8),
                  size: 22,
                  weight: 400)
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          isSelected = selected;
        });
      },
      backgroundColor: white,
      showCheckmark: false,
      checkmarkColor: white,
      side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(217, 217, 217, 1),
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      selectedColor: primaryLightColor,
      labelStyle: GoogleFonts.poppins(
        color: isSelected ? white : const Color.fromRGBO(166, 166, 166, 0.8),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
