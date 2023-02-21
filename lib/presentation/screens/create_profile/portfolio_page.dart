import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color.fromRGBO(175, 176, 182, 1)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Image(
                  image: AssetImage(
                    'images/image 18.png',
                  ),
                  width: 118.35,
                  height: 118.35,
                ),
                Image(
                    image: AssetImage('images/image 13.png'),
                    width: 118.35,
                    height: 118.35),
                Image(
                    image: AssetImage('images/image 14.png'),
                    width: 118.35,
                    height: 118.35),
              ],
            ),
            const SizedBox(
              height: 19.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Image(
                    image: AssetImage('images/image 15.png'),
                    width: 118.35,
                    height: 118.35),
                Image(
                    image: AssetImage('images/image 16.png'),
                    width: 118.35,
                    height: 118.35),
                Image(
                    image: AssetImage('images/image 17.png'),
                    width: 118.35,
                    height: 118.35)
              ],
            )
          ],
        ),
      ),
    );
  }
}
/*class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  late SfRangeValues _values;
  late NumberFormat _numberFormat;
  late TextEditingController _rangeStartController;
  late TextEditingController _rangeEndController;

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
    return Scaffold(
      body: SfRangeSlider(
        inactiveColor: Color.fromRGBO(217, 217, 217, 1),
        activeColor: white,
        min: 1000,
        max: 10000,
        //enableTooltip: true,
        shouldAlwaysShowTooltip: true,
        //labelPlacement: LabelPlacement.betweenTicks,
        values: _values,
        minorTicksPerInterval: 500,
        stepSize: 500,
        endThumbIcon: Icon(Icons.radio_button_checked,
          color: Color.fromRGBO(22, 80, 105, 1),
        ),
        startThumbIcon: Icon(Icons.radio_button_checked,
          color: Color.fromRGBO(22, 80, 105, 1),
        ),
       // startThumbIcon: _buildThumbIcon(_rangeStartController),
        //endThumbIcon: _buildThumbIcon(_rangeEndController),
       // values: _values,
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
    );
  }
}*/
