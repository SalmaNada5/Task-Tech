
import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../constants/colors.dart';

class AboutmePage extends StatefulWidget {
  const AboutmePage({Key? key}) : super(key: key);

  @override
  State<AboutmePage> createState() => _AboutmePageState();
}

class _AboutmePageState extends State<AboutmePage> {
  SfRangeValues _values = SfRangeValues(2000, 5000);
  RangeValues currentSliderValue = const RangeValues(2000, 5000);
  double _uppervalue = 10000;
  double _lowervalue = 500;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lorem ipsum dolor sit amet, consectetur elit adipiscing'
                ' elit. Dolor fermentum libero velit quis in fermentum justo, '
                'velit quis non.',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(124, 124, 124, 1)
              ),),
            SizedBox(height: 19,),
            Row(
              children: [
                Text('Education',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromRGBO(13, 13, 38, 1)
                ),),
                SizedBox(width: 240,),
                TextButton(
                  onPressed: () {  },
                  child: Text('See all',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color.fromRGBO(175, 176, 182, 1)
                    ), ),
                )
              ],
            ),
            SizedBox(height: 16,),
            Center(
              child: Container(
                height: 78,

                width: 371,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(224, 224, 224, 0.9),
                          spreadRadius:3,
                          blurRadius: 7,
                          offset: Offset(0,2)
                      )
                    ]

                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 23,
                          backgroundImage: AssetImage(
                              'images/suez canal.png'
                          )
                      ),
                      SizedBox(width: 14,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Computer Science',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromRGBO(13, 13, 38, 1)
                            ),),
                          Text('Bachelor',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color.fromRGBO(13, 13, 38, 1)
                            ),)
                        ],
                      ),
                      SizedBox(width: 36,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Suez canal university',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color.fromRGBO(13, 13, 38, 1)
                            ),),
                          Text('2019 - 2023',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color.fromRGBO(13, 13, 38, 1)
                            ),)
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 22,),
            Text('Salary',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromRGBO(13, 13, 38, 1)
              ),),
            SizedBox(height: 20,),
            /*SliderTheme(
                                         data: SliderThemeData(
                                           activeTrackColor: Color.fromRGBO(22, 80, 105, 1),
                                           inactiveTrackColor: Color.fromRGBO(217, 217, 217, 1),
                                           thumbColor: Color.fromRGBO(22, 80, 105, 1),

                                           //thumbShape: RoundRangeSliderThumbShape()
                                         ),
                                         child: RangeSlider(
                                             values: currentSliderValue,
                                             max: 10000,

                                             labels: RangeLabels(
                                               currentSliderValue.start.round().toString(),
                                               currentSliderValue.end.round().toString()
                                             ),
                                             onChanged: (RangeValues values){
                                               setState(() {
                                                 currentSliderValue = values;
                                               });
                                             }),
                                       ),*/
            SfRangeSlider(
              inactiveColor: Color.fromRGBO(217, 217, 217, 1),
              activeColor: white,
               min: 1000,
              max: 10000,
              //enableTooltip: true,
              shouldAlwaysShowTooltip: true,
              labelPlacement: LabelPlacement.betweenTicks,
              values: _values,
              minorTicksPerInterval: 500,
              stepSize: 500,
              thumbShape: SfThumbShape(),
              endThumbIcon: Icon(Icons.radio_button_checked,
                color: Color.fromRGBO(22, 80, 105, 1),
              ),
              startThumbIcon: Icon(Icons.radio_button_checked,
                color: Color.fromRGBO(22, 80, 105, 1),
              ),
              onChanged: (SfRangeValues values) {
                setState(() {
                  _values =values;
                });
                },
                                       )

            /*FlutterSlider(
              values: [500,1500,2000, 10000],
              rangeSlider: true,
              min: 0,
              max: 10000,
              selectByTap: true,
              jump: true,
              //step: FlutterSliderStep(step: 500),
              handlerAnimation: FlutterSliderHandlerAnimation(
                  curve: Curves.elasticOut,
                  reverseCurve: null,
                  duration: Duration(milliseconds: 700),
                  scale: 1.4),

              handler: FlutterSliderHandler(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Icon(Icons.radio_button_checked,
                  color: Color.fromRGBO(22, 80, 105, 1), size: 24,),
              ),
              rightHandler: FlutterSliderHandler(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Icon(Icons.radio_button_checked,
                  color: Color.fromRGBO(22, 80, 105, 1), size: 24,),
              ),
              tooltip: FlutterSliderTooltip(

                  leftSuffix: Icon(Icons.attach_money, size: 14,
                    weight:500,
                    color: Color.fromRGBO(177, 177, 177, 1),),
                  rightSuffix:Icon(Icons.attach_money, size: 14,
                    weight:500,
                    color: Color.fromRGBO(177, 177, 177, 1),) ,
                  alwaysShowTooltip: true,
                 custom: (value) {
                    return Text(value.toString()+'\$',
                      style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),);
            }
              ),
              trackBar: FlutterSliderTrackBar(

                activeTrackBarHeight: 5,
                inactiveTrackBarHeight: 5,
                inactiveTrackBar: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(2),

              ),
                activeTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color.fromRGBO(22, 80, 105, 1)
                )
              ),

              disabled: false,

              onDragging: (handlerIndex, lowervalue, uppervalue){
                _lowervalue = lowervalue;
                _uppervalue = uppervalue;
                setState(() {

                });
              },
            )*/,
            SizedBox(height: 30,),
            Text('Skills',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromRGBO(13, 13, 38, 1)
              ),),
            SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 103,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(206, 218, 223, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                      onPressed: () {
                        print('click');
                      },
                      child:Text(
                        'UI/ UX Design',
                        style: TextStyle(fontSize: 11.5,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w400),
                      )
                  ),
                ),
                SizedBox(width: 17,),
                Container(
                  height: 32,
                  width: 103,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(206, 218, 223, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                      onPressed: () {},
                      child:Text(
                        'Interfaces',
                        style: TextStyle(fontSize: 11.5,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w400),
                      )
                  ),
                ),
                SizedBox(width: 17,),
                Container(
                  height: 32,
                  width: 103,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(206, 218, 223, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                      onPressed: () {},
                      child:Text(
                        'Web Design',
                        style: TextStyle(fontSize: 11.5,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w400),
                      )
                  ),
                ),
              ],
            )


          ],
        ),
      ),
    ) ;
  }
}

