import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/text_styles.dart';

class ReusablePostWidget extends StatelessWidget {
  const ReusablePostWidget(
      {super.key,
      required this.profileImgUrl,
      required this.accountName,
      required this.postDescription,
      required this.postTime});
  final String profileImgUrl;
  final String accountName;
  final String postDescription;
  final String postTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffF5F5F5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImgUrl),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                accountName,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                postTime,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: const Color(0xff1B2936),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              postDescription,
              softWrap: true,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: postDescriptionStyle,
            ),
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'taskDetails'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(primaryLightColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'View Task',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
