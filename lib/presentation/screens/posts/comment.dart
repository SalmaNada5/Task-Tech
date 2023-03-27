import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:task_tech/constants/text_styles.dart';

class ReusableCommentWidget extends StatefulWidget {
  const ReusableCommentWidget(
      {super.key,
      required this.userName,
      required this.rate,
      required this.imgUrl,
      required this.date,
      required this.text});
  final String userName;
  final double rate;
  final String imgUrl;
  final String date;
  final String text;

  @override
  State<ReusableCommentWidget> createState() => _ReusableCommentWidgetState();
}

class _ReusableCommentWidgetState extends State<ReusableCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.imgUrl),
              radius: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName,
                  style: headStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                SmoothStarRating(
                  rating: widget.rate,
                  size: 15,
                  filledIconData: Icons.star,
                  defaultIconData: Icons.star_border,
                  halfFilledIconData: Icons.star_half,
                  starCount: 5,
                  spacing: 2,
                  color: const Color.fromRGBO(255, 193, 7, 1),
                  borderColor: const Color.fromRGBO(218, 218, 218, 1),
                ),
              ],
            ),
            const Spacer(),
            Text(
              widget.date,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: const Color(0xffB1B1B1),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.text,
          softWrap: true,
          textAlign: TextAlign.left,
          overflow: TextOverflow.visible,
          style: postDescriptionStyle.copyWith(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
