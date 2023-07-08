import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HighestRatedFreelancer extends StatelessWidget {
  const HighestRatedFreelancer(
      {super.key,
      required this.userImgUrl,
      required this.userName,
      required this.job,
      required this.rate,
      required this.onPress});
  final String userImgUrl;
  final String userName;
  final String job;
  final num rate;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.3 * Constants.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: CachedNetworkImage(
                imageUrl: userImgUrl,
                errorWidget: (context, url, error) {
                  return Image.asset('images/default person.png');
                }),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            userName,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            job,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: const Color(0xffB1B1B1),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 12,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$rate',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xffCEDADF),
              ),
              shadowColor: MaterialStateProperty.all(
                const Color.fromRGBO(22, 80, 105, 0.5),
              ),
              elevation: MaterialStateProperty.all(10),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            onPressed: onPress,
            child: Text(
              'View profile',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xff165069),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
