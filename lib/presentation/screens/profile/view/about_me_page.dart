import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:task_tech/presentation/screens/auth/controller/cur_user_controller.dart';

class AboutmePage extends StatefulWidget {
  const AboutmePage({
    Key? key,
  }) : super(key: key);
  @override
  State<AboutmePage> createState() => _AboutmePageState();
}

class _AboutmePageState extends State<AboutmePage> {
  late SfRangeValues value;
  //late NumberFormat _numberFormat;
  late TextEditingController _rangeStartController = TextEditingController();
  late TextEditingController _rangeEndController = TextEditingController();

  // String _getFormattedText(dynamic value) {
  //   return _numberFormat.format(value);
  // }

  @override
  void initState() {
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
    Color textColor =
        Theme.of(context).textTheme.headlineSmall!.color ?? Colors.grey;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              maxLines: 5,
              CurrentUserInfoController.userInfoModel.data?.user.about ?? '',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(124, 124, 124, 1)),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Education',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: textColor),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: const Color.fromRGBO(175, 176, 182, 1)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              CurrentUserInfoController.userInfoModel.data?.user.education ??
                  '',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color.fromRGBO(124, 124, 124, 1)),
            ),
            // Center(
            //   child: Container(
            //     height: 78,
            //     width: 371,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         color: const Color.fromRGBO(255, 255, 255, 1),
            //         boxShadow: const [
            //           BoxShadow(
            //               color: Color.fromRGBO(224, 224, 224, 0.9),
            //               spreadRadius: 3,
            //               blurRadius: 7,
            //               offset: Offset(0, 2))
            //         ]),
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            //       child: Row(
            //         children: [
            //           const CircleAvatar(
            //               radius: 23,
            //               backgroundImage: AssetImage('images/suez canal.png')),
            //           const SizedBox(
            //             width: 14,
            //           ),

            //           // const Column(
            //           //   crossAxisAlignment: CrossAxisAlignment.start,
            //           //   mainAxisAlignment: MainAxisAlignment.center,
            //           //   children: [
            //           //     Text(
            //           //       'Computer Science',
            //           //       style: TextStyle(
            //           //           fontWeight: FontWeight.w600,
            //           //           fontSize: 14,
            //           //           color: Color.fromRGBO(13, 13, 38, 1)),
            //           //     ),
            //           //     Text(
            //           //       'Bachelor',
            //           //       style: TextStyle(
            //           //           fontWeight: FontWeight.w400,
            //           //           fontSize: 13,
            //           //           color: Color.fromRGBO(13, 13, 38, 1)),
            //           //     )
            //           //   ],
            //           // ),

            //           const SizedBox(
            //             width: 36,
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 UserProfileController
            //                         .userProfileModel.data?.user.education ??
            //                     "",
            //                 style: const TextStyle(
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 12,
            //                     color: Color.fromRGBO(13, 13, 38, 1)),
            //               ),
            //               // Text(
            //               //   '2019 - 2023',
            //               //   style: TextStyle(
            //               //       fontWeight: FontWeight.w400,
            //               //       fontSize: 13,
            //               //       color: Color.fromRGBO(13, 13, 38, 1)),
            //               // )
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 22,
            ),
            Text(
              'Salary',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 16, color: textColor),
            ),
            const SizedBox(
              height: 60,
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
                activeColor: Theme.of(context).primaryColor,
                min: 10,
                max: 1000,
                enableTooltip: true,
                shouldAlwaysShowTooltip: true,
                values: SfRangeValues(
                  CurrentUserInfoController.userInfoModel.data?.user.minimum ??
                      100,
                  CurrentUserInfoController.userInfoModel.data?.user.maximum ??
                      500,
                ),
                minorTicksPerInterval: 10,
                startThumbIcon: Image.asset('images/thumbIcon.png'),
                endThumbIcon: Image.asset('images/thumbIcon.png'),
                onChanged: (sFRange) {},
                stepSize: 10,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Skills',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 16, color: textColor),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CurrentUserInfoController
                        .userInfoModel.data?.user.skills.length ??
                    0,
                itemBuilder: (context, i) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(206, 218, 223, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      CurrentUserInfoController
                              .userInfoModel.data?.user.skills[i] ??
                          '',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: textColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Container(
            //       height: 32,
            //       width: MediaQuery.of(context).size.width * 0.3,
            //       decoration: BoxDecoration(
            //         color: const Color.fromRGBO(206, 218, 223, 1),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       child: MaterialButton(
            //           onPressed: () {},
            //           child: Text(
            //             'C',
            //             style: GoogleFonts.poppins(
            //                 fontSize: 11.5,
            //                 color: primaryLightColor,
            //                 fontWeight: FontWeight.w400),
            //           )),
            //     ),
            //     const Spacer(),
            //     Container(
            //       height: 32,
            //       width: MediaQuery.of(context).size.width * 0.3,
            //       decoration: BoxDecoration(
            //         color: const Color.fromRGBO(206, 218, 223, 1),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       child: MaterialButton(
            //           onPressed: () {},
            //           child: Text(
            //             'C++',
            //             style: GoogleFonts.poppins(
            //                 fontSize: 11.5,
            //                 color: primaryLightColor,
            //                 fontWeight: FontWeight.w400),
            //           )),
            //     ),
          ],
        ),
      ),
    );
  }
}
