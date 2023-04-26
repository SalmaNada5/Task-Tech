// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class NotificationList {
  String name;
  String imageURL;
  String time;
  String notificationMessage;
  bool isRequestNotification;

  NotificationList(
      {required this.name,
      required this.imageURL,
      required this.time,
      required this.notificationMessage,
      required this.isRequestNotification});
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationList> notificationList = [
    NotificationList(
        name: 'Steven Rose',
        imageURL: 'images/Ellipse 20.png',
        time: '1 hour ago',
        notificationMessage: 'Send you a request to you ',
        isRequestNotification: true),
    NotificationList(
        name: 'Steven Rose',
        imageURL: 'images/Ellipse 20.png',
        time: '3 hour ago',
        notificationMessage: ' commented on your \nPost .',
        isRequestNotification: false),
    NotificationList(
        name: 'Steven Rose',
        imageURL: 'images/Ellipse 20.png',
        time: '4 hour ago',
        notificationMessage: ' Saved your Post .',
        isRequestNotification: false),
    NotificationList(
        name: 'Steven Rose',
        imageURL: 'images/Ellipse 20.png',
        time: '1 hour ago',
        notificationMessage: 'Send you a request to you ',
        isRequestNotification: true),
    NotificationList(
        name: 'Steven Rose',
        imageURL: 'images/Ellipse 20.png',
        time: '1 hour ago',
        notificationMessage: 'Send you a request to you ',
        isRequestNotification: true),
    NotificationList(
        name: 'Steven Rose',
        imageURL: 'images/Ellipse 20.png',
        time: '1 hour ago',
        notificationMessage: 'Send you a request to you ',
        isRequestNotification: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 5),
          child: IconButton(
            icon: Image.asset(
              'icons/bi_arrow-left-circle-fill.png',
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(22, 80, 105, 1),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 15,
          end: 15,
          top: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 15),
                child: Row(
                  children: [
                    Text(
                      //textScaleFactor:MediaQuery.of(context).textScaleFactor* 0.9,
                      'Today',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.19,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.done_all,
                        color: Color.fromRGBO(22, 80, 105, 1),
                      ),
                      label: Text(
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 0.9,
                        'Mark as read',
                        style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(22, 80, 105, 1)),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 0.8,
                        'Clear all',
                        style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(241, 27, 27, 1)),
                      ),
                    )
                  ],
                ),
              ),
              ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return notificationList[index].isRequestNotification
                      ? RequestNotification(
                          name: notificationList[index].name,
                          imageURL: notificationList[index].imageURL,
                          time: notificationList[index].time,
                          notificationMessage:
                              notificationList[index].notificationMessage)
                      : NormalNotification(
                          name: notificationList[index].name,
                          imageURL: notificationList[index].imageURL,
                          time: notificationList[index].time,
                          notificationMessage:
                              notificationList[index].notificationMessage);
                },
                itemCount: notificationList.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
                spreadRadius: 3,
                blurRadius: 7,
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
                SizedBox(width: MediaQuery.of(context).size.width * 0.25),
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
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: primaryLightColor,
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
                spreadRadius: 3,
                blurRadius: 7,
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
