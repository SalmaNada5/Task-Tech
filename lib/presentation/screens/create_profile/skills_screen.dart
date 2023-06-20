import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/create_profile/widgets/app_bar_widget.dart';
import 'package:task_tech/presentation/screens/create_profile/widgets/filter_chip_widget.dart';

import 'bio_screen.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  SkillsScreenState createState() => SkillsScreenState();
}

class SkillsScreenState extends State<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
     //String chiptext ='';
    //bool addchip = false;
    var skillController = TextEditingController();
    return Scaffold(
            backgroundColor: Colors.white,

      appBar: MyAppbar(percent: 40),
      body: Center(
        child: Padding(
          padding:  EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * 0.03,
            end: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03,
            top: MediaQuery.of(context).size.height * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                    image: AssetImage('images/Career progress-amico 1.png')),
                 Text(
                  'Interest & Skills',
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: const Color.fromRGBO(124, 124, 124, 1)),
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
                  
                  //crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: const <Widget>[
                    FilterChipWidget(chipName: 'UI/UX'),
                    FilterChipWidget(chipName: 'Technology'),
                    FilterChipWidget(chipName: 'Strategy'),
                    FilterChipWidget(chipName: 'Interfaces'),
                    FilterChipWidget(chipName: 'Programming'),
                    FilterChipWidget(chipName: 'Writing'),
                    FilterChipWidget(chipName: 'Web design'),
                    FilterChipWidget(chipName: 'Art & illustration'),
                    //addchip==true? FilterChipWidget(chipName: chiptext):Container(),
                      
                  ],
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
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8.6)),
                        ),
                        
                        hintText: 'Type a skill..',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(184, 184, 184, 1))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 345,
                    height: 55,
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
                        child:  Text(
                          'Next',
                          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
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

