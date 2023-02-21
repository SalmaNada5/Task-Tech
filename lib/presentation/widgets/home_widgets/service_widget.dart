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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 10)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(8),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.serviceImgUrl))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: !isFavorite
                          ? const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 16,
                            )
                          : const Icon(
                              Icons.favorite,
                              size: 16,
                              color: Color(0xffF11B1B),
                            ),
                      splashRadius: 12,
                      splashColor: Colors.grey,
                    ),
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
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      widget.description,
                      softWrap: true,
                      maxLines: 3,
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
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.4,
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
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
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
                        '${widget.rate}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.2),
                        child: Text(
                          '${widget.numOfReviews} reviews',
                          style: GoogleFonts.poppins(
                            fontSize: 8,
                            color: const Color(0xffA7A7A7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
