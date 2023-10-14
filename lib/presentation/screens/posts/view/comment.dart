import 'package:task_tech/utils/exports.dart';

class ReusableCommentWidget extends StatefulWidget {
  const ReusableCommentWidget(
      {super.key,
      required this.userName,
      required this.rate,
      required this.imgUrl,
      required this.date,
      required this.text});
  final String userName;
  final num rate;
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName,
                  style: headStyle.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.headlineSmall!.color,
                  ),
                ),
                SmoothStarRating(
                  rating: widget.rate.toDouble(),
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
