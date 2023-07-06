import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';

class ServicesItem extends StatefulWidget {
  const ServicesItem({
    super.key,
    required this.serviceImgUrl,
    required this.profileImgUrl,
    required this.userName,
    required this.description,
    required this.salary,
    required this.rate,
  });
  final String serviceImgUrl;
  final String profileImgUrl;
  final String userName;
  final String description;
  final int salary;
  final num rate;
  @override
  State<ServicesItem> createState() => _ServicesItemState();
}

bool isFavorite = false;

class _ServicesItemState extends State<ServicesItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.5 * Constants.screenWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(8),
        ),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.serviceImgUrl))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImgUrl),
                  radius: 10,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.userName,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 0.06 * Constants.screenHeight,
              width: 0.4 * Constants.screenWidth,
              child: Text(
                widget.description,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 0.9,
              width: 0.4 * Constants.screenWidth,
              color: const Color(0xffB1B1B1),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Starting at',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff7C7C7C),
                  ),
                ),
                Text(
                  '\$${widget.salary}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${widget.rate}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
