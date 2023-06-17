import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/text_styles.dart';

import '../../constants/colors.dart';

class UnexpectedErrorScreen extends StatelessWidget {
  const UnexpectedErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'An unexpected error\noccurred!',
              textAlign: TextAlign.center,
              style: titleStyle.copyWith(
                fontSize: 32,
              ),
            ),
            Image.asset('images/Computer troubleshooting-pana 1.png'),
            Text(
              'The link you followed probably\nbroken check the URL spelling\nand try again',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: const Color(0xff3E4446),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 0.35 * screenW,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              child: Text(
                'Go back',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
