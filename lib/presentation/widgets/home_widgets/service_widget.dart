import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesItem extends StatefulWidget {
  const ServicesItem(
      {super.key,
      required this.serviceImgUrl,
      required this.profileImgUrl,
      required this.userName,
      required this.description,
      required this.salary,
      required this.rate,
      required this.numOfReviews});
  final String serviceImgUrl;
  final String profileImgUrl;
  final String userName;
  final String description;
  final int salary;
  final double rate;
  final int numOfReviews;
  @override
  State<ServicesItem> createState() => _ServicesItemState();
}

bool isFavorite = false;

class _ServicesItemState extends State<ServicesItem> {
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 0.5 * screenW,
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
              height: 0.06 * screenH,
              width: 0.4 * screenW,
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
              width: 0.4 * screenW,
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
                Text(
                  '${widget.numOfReviews} reviews',
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    color: const Color(0xffA7A7A7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
