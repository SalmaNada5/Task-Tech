import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';


class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.03),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height*0.06,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(22, 80, 105, 0.21),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_outlined,
                        color: primaryLightColor,
                        weight: 500,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Upload photo',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: primaryLightColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Image(
                  image: const AssetImage(
                    'images/image 18.png',
                  ),
                  width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.width*0.3
                ),
                 const Spacer(),
                Image(
                    image: const AssetImage('images/image 13.png'),
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.width*0.3),
                     const Spacer(),
                Image(
                    image: const AssetImage('images/image 14.png'),
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.width*0.3),
              ],
            ),
            const SizedBox(
              height: 19.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Image(
                    image: const AssetImage('images/image 15.png'),
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.width*0.3),
                    const Spacer(),
                Image(
                    image: const AssetImage('images/image 16.png'),
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.width*0.3),
                    const Spacer(),
                Image(
                    image: const AssetImage('images/image 17.png'),
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.width*0.3)
              ],
            )
          ],
        ),
      ),
    );
  }
}
