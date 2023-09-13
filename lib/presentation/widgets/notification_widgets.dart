// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RequestNotification extends StatefulWidget {
  String name;
  String imageURL;
  String time;
  String notificationMessage;
  RequestNotification(
      {super.key,
      required this.name,
      required this.imageURL,
      required this.time,
      required this.notificationMessage});

  @override
  State<RequestNotification> createState() => _RequestNotificationState();
}

class _RequestNotificationState extends State<RequestNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(224, 224, 224, 0.9),
          ),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(224, 224, 224, 0.9),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 8, end: 15, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.imageURL),
                  radius: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  textScaleFactor: 0.9,
                  widget.name,
                  style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(
                          22, 80, 105, 1)), // default text style
                ),
                const Spacer(),
               // SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                Text(
                  textScaleFactor: 0.9,
                  widget.time,
                  style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.036,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(177, 177, 177, 0.95)),
                ),
              ],
            ),
            Text(
              widget.notificationMessage,
              style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(124, 124, 124, 0.92)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 80, 105, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 5.0, bottom: 5, start: 20, end: 20),
                      child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Accept',
                            style: GoogleFonts.poppins(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        )),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 5.0, bottom: 5, start: 20, end: 20),
                      child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Decline',
                            style: GoogleFonts.poppins(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(22, 80, 105, 1)),
                          )),
                    ),
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

class NormalNotification extends StatefulWidget {
  String name;
  String imageURL;
  String time;
  String notificationMessage;
  NormalNotification(
      {super.key,
      required this.name,
      required this.imageURL,
      required this.time,
      required this.notificationMessage});

  @override
  State<NormalNotification> createState() => _NormalNotificationState();
}

class _NormalNotificationState extends State<NormalNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(224, 224, 224, 0.9),
          ),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(224, 224, 224, 0.9),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 8, end: 15, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.imageURL),
                  radius: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text.rich(
                  textScaleFactor: 0.9,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  TextSpan(
                    text: widget.name,
                    style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(
                            22, 80, 105, 1)), // default text style
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.notificationMessage,
                        style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(38, 50, 56, 1)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.of(context).size.width * 0.18),
              child: Text(
                widget.time,
                style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.036,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(177, 177, 177, 0.95)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
