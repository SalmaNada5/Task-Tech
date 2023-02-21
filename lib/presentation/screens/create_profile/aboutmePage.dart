import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../constants/colors.dart';

class AboutmePage extends StatefulWidget {
  const AboutmePage({Key? key}) : super(key: key);

  @override
  State<AboutmePage> createState() => _AboutmePageState();
}

class _AboutmePageState extends State<AboutmePage> {
  SfRangeValues values = const SfRangeValues(2000, 5000);
  RangeValues currentSliderValue = const RangeValues(2000, 5000);
  // final double _uppervalue = 10000;
  // final double _lowervalue = 500;
  late SfRangeValues value;
  late NumberFormat _numberFormat;
  late TextEditingController _rangeStartController = TextEditingController();
  late TextEditingController _rangeEndController = TextEditingController();

  Widget _buildThumbIcon(TextEditingController controller) {
    return Transform.translate(
      // Here 20 is thumb diameter and 5 is spacing between thumb and text.
      offset: const Offset(0, 25),
      child: OverflowBox(
        maxWidth: 150,
        child: TextField(
          textAlign: TextAlign.center,
          decoration:
              const InputDecoration(border: InputBorder.none, suffixText: '\$'),
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
    value = const SfRangeValues(1000, 10000);
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
            const Text(
              'Lorem ipsum dolor sit amet, consectetur elit adipiscing'
              ' elit. Dolor fermentum libero velit quis in fermentum justo, '
              'velit quis non.',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(124, 124, 124, 1)),
            ),
            const SizedBox(
              height: 19,
            ),
            Row(
              children: [
                const Text(
                  'Education',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(13, 13, 38, 1)),
                ),
                const SizedBox(
                  width: 240,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color.fromRGBO(175, 176, 182, 1)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
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
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                          radius: 23,
                          backgroundImage: AssetImage('images/suez canal.png')),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Computer Science',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromRGBO(13, 13, 38, 1)),
                          ),
                          Text(
                            'Bachelor',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color.fromRGBO(13, 13, 38, 1)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 36,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Suez canal university',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color.fromRGBO(13, 13, 38, 1)),
                          ),
                          Text(
                            '2019 - 2023',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color.fromRGBO(13, 13, 38, 1)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              'Salary',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromRGBO(13, 13, 38, 1)),
            ),
            const SizedBox(
              height: 50,
            ),
            SfRangeSliderTheme(
              data: SfRangeSliderThemeData(
                tooltipBackgroundColor: Colors.white,
                overlayRadius: 10,
                tooltipTextStyle: const TextStyle(
                  color: Color(0xffB1B1B1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: SfRangeSlider(
                inactiveColor: const Color.fromRGBO(217, 217, 217, 1),
                activeColor: primaryLightColor,
                min: 1000,
                max: 10000,
                enableTooltip: true,
                shouldAlwaysShowTooltip: true,
                values: value,
                minorTicksPerInterval: 500,
                stepSize: 500,
                startThumbIcon: Image.asset('images/thumbIcon.png'),
                endThumbIcon: Image.asset('images/thumbIcon.png'),
                onChangeStart: (SfRangeValues newValues) {
                  _rangeStartController.text =
                      _getFormattedText(newValues.start);
                  _rangeEndController.text = _getFormattedText(newValues.end);
                },
                onChanged: (SfRangeValues newValues) {
                  setState(() {
                    _rangeStartController.text =
                        _getFormattedText(newValues.start);
                    _rangeEndController.text = _getFormattedText(newValues.end);
                    value = newValues;
                  });
                },
                onChangeEnd: (SfRangeValues newValues) {
                  _rangeStartController.text = "";
                  _rangeEndController.text = "";
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Skills',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromRGBO(13, 13, 38, 1)),
            ),
            const SizedBox(
              height: 16,
            ),
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
                      onPressed: () {},
                      child: Text(
                        'UI/ UX Design',
                        style: TextStyle(
                            fontSize: 11.5,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w400),
                      )),
                ),
                const SizedBox(
                  width: 17,
                ),
                Container(
                  height: 32,
                  width: 103,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(206, 218, 223, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Interfaces',
                        style: TextStyle(
                            fontSize: 11.5,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w400),
                      )),
                ),
                const SizedBox(
                  width: 17,
                ),
                Container(
                  height: 32,
                  width: 103,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(206, 218, 223, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Web Design',
                        style: TextStyle(
                            fontSize: 11.5,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
