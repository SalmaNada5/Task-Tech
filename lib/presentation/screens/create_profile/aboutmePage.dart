
import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../constants/colors.dart';


class AboutmePage extends StatefulWidget {
  const AboutmePage({Key? key}) : super(key: key);

  @override
  State<AboutmePage> createState() => _AboutmePageState();
}

class _AboutmePageState extends State<AboutmePage> {
  SfRangeValues values = const SfRangeValues(2000, 5000);
  RangeValues currentSliderValue = const RangeValues(2000, 5000);
  final double _uppervalue = 10000;
  final double _lowervalue = 500;
  late SfRangeValues _values;
  late NumberFormat _numberFormat;
  late TextEditingController _rangeStartController = TextEditingController();
  late TextEditingController _rangeEndController= TextEditingController();

  Widget _buildThumbIcon(TextEditingController controller) {
    return Transform.translate(
      // Here 20 is thumb diameter and 5 is spacing between thumb and text.
      offset: const Offset(0, 25),
      child: OverflowBox(
        maxWidth: 150,
        child: TextField(
          textAlign: TextAlign.center,

          decoration:
          const InputDecoration(border: InputBorder.none,

              suffixText: '\$'),
          controller: controller,
        ),
      ),
    );
  }

  String _getFormattedText(dynamic value) {
    return _numberFormat.format(value);
  }

  @override
  void initState() {
    _values = const SfRangeValues(1000, 10000);
    _numberFormat = NumberFormat('#.### \$');
    _rangeStartController = TextEditingController();
    _rangeEndController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _rangeStartController.dispose();
    _rangeEndController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Lorem ipsum dolor sit amet, consectetur elit adipiscing'
                ' elit. Dolor fermentum libero velit quis in fermentum justo, '
                'velit quis non.',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(124, 124, 124, 1)
              ),),
            const SizedBox(height: 19,),
            Row(
              children: [
                const Text('Education',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromRGBO(13, 13, 38, 1)
                ),),
                const SizedBox(width: 240,),
                TextButton(
                  onPressed: () {  },
                  child: const Text('See all',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color.fromRGBO(175, 176, 182, 1)
                    ), ),
                )
              ],
            ),
            const SizedBox(height: 16,),
            Center(
              child: Container(
                height: 78,

                width: 371,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(224, 224, 224, 0.9),
                          spreadRadius:3,
                          blurRadius: 7,
                          offset: Offset(0,2)
                      )
                    ]

                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                          radius: 23,
                          backgroundImage: AssetImage(
                              'images/suez canal.png'
                          )
                      ),
                      const SizedBox(width: 14,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
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
                      const SizedBox(width: 36,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
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
            const SizedBox(height: 22,),
            const Text('Salary',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromRGBO(13, 13, 38, 1)
              ),),
            const SizedBox(height: 20,),

        SfRangeSlider(
          inactiveColor: const Color.fromRGBO(217, 217, 217, 1),
          activeColor: white,
          min: 1000,
          max: 10000,
          enableTooltip: true,
          shouldAlwaysShowTooltip: true,
          //labelPlacement: LabelPlacement.betweenTicks,
          values: _values,
          minorTicksPerInterval: 500,
          stepSize: 500,
          /*endThumbIcon: Icon(Icons.radio_button_checked,
            color: Color.fromRGBO(22, 80, 105, 1),
          ),
          startThumbIcon: Icon(Icons.radio_button_checked,
            color: Color.fromRGBO(22, 80, 105, 1),
          ),*/
           startThumbIcon: _buildThumbIcon(_rangeStartController),
          endThumbIcon: _buildThumbIcon(_rangeEndController),
          onChangeStart: (SfRangeValues newValues) {
            _rangeStartController.text = _getFormattedText(newValues.start);
            _rangeEndController.text = _getFormattedText(newValues.end);
          },
          onChanged: (SfRangeValues newValues) {
            setState(() {
              _rangeStartController.text = _getFormattedText(newValues.start);
              _rangeEndController.text = _getFormattedText(newValues.end);
              _values = newValues;
            });
          },
          onChangeEnd: (SfRangeValues newValues) {
            _rangeStartController.text = "";
            _rangeEndController.text = "";
          },
        ),

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
           /* SfRangeSlider(
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
                                       )*/

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
            )*/
            const SizedBox(height: 30,),
            const Text('Skills',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromRGBO(13, 13, 38, 1)
              ),),
            const SizedBox(height: 16,),
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
                      },
                      child:Text(
                        'UI/ UX Design',
                        style: TextStyle(fontSize: 11.5,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w400),
                      )
                  ),
                ),
                const SizedBox(width: 17,),
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
                const SizedBox(width: 17,),
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

