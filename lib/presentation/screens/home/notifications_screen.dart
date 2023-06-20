// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/widgets/notification_widgets.dart';

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
              SingleChildScrollView(
                child: ListView.separated(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

