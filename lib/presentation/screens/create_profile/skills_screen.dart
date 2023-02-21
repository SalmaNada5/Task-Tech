import 'package:flutter/material.dart';
import 'package:task_tech/constants/colors.dart';

import 'appBarWidget.dart';
import 'bio_screen.dart';

class Skills_Screen extends StatefulWidget {
  const Skills_Screen({Key? key}) : super(key: key);

  @override
  _Skills_ScreenState createState() => _Skills_ScreenState();
}

class _Skills_ScreenState extends State<Skills_Screen> {

  @override
  Widget build(BuildContext context) {
    var skillController = TextEditingController();
    return Scaffold(
       appBar: MyAppbar(percent: 40),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              right:15,
              left: 15,
              bottom: 20

          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Image(image: AssetImage('images/Career progress-amico 1.png')),
                const Text('Interest & Skills',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(124, 124, 124, 1)
                  ),),
                const SizedBox(height: 10,),
                Container(

                  height: 1,
                  color: const Color.fromRGBO(218, 218, 218, 1),
                ),
                const SizedBox(height: 12,),
                Wrap(
                  //crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 3,
                  children: const <Widget>[

                    FilterChipWidget(chipName: 'UI/UX'),
                    FilterChipWidget(chipName: 'Technology'),
                    FilterChipWidget(chipName: 'Strategy'),
                    FilterChipWidget(chipName: 'Interfaces'),
                    FilterChipWidget(chipName: 'Programming'),
                    FilterChipWidget(chipName: 'Writing'),
                    FilterChipWidget(chipName: 'Web design'),
                    FilterChipWidget(chipName: 'Art & illustration'),


                  ],
                ),
                const SizedBox(height: 20,),
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8.6)),
                        ),
                        hintText: 'Type a skill..',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(184, 184, 184, 1)
                        )

                    ),

                  ),
                ),
                const SizedBox(height: 30,),
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
                                  builder: (context)=> const BioScreen()));
                        },
                        child:const Text('Next',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),)
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
  const FilterChipWidget({Key? key, required this.chipName}) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;
     late Icon icon;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.chipName),
            const SizedBox(width: 3,),
            icon = _isSelected?Icon(
                  Icons.check,
                  color: white,
                  size: 22,
                  weight: 400
              ): const Icon(
                Icons.add,
                color: Color.fromRGBO(166,166,166,0.8),
                size: 22, weight: 400)




          ],
        ),

        selected: _isSelected,
        onSelected: (isSelected){
          setState(() {
            _isSelected = isSelected;
          });
        },
      backgroundColor: white,
      showCheckmark: false,
      checkmarkColor: white,

      side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(217, 217, 217, 1),
          style: BorderStyle.solid
      ),
      /*avatar: Icon(
        Icons.add,
        size: 22,
        color: Color.fromRGBO(166,166,166,0.8),
        textDirection: TextDirection.rtl,
      ),*/


      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(20),


      ),

      selectedColor: primaryLightColor,
      labelStyle: TextStyle(
          color: _isSelected? white : const Color.fromRGBO(166,166,166,0.8),
          fontSize: 16,
          fontWeight: FontWeight.w400,
      ),
    );
  }
}

