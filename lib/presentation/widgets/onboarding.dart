import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle});
  final String? img;
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img!),
        SizedBox(
          height: 1 / 15 * screenH,
        ),
        Text(
          title!,
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: const Color(0xff95969D),
                fontSize: 19,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
