import 'package:task_tech/presentation/screens/auth/models/auth_model.dart';

class Messages {
  String name;
  String messageText;
  String image;
  String time;
  final bool isRead;
  final int unreadCount;
  final bool isReceiveMess;

  Messages(
      {required this.name,
      required this.messageText,
      required this.image,
      required this.isRead,
      required this.unreadCount,
      required this.time,
      required this.isReceiveMess});
}

  List<Messages> chatsList = [
    Messages(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        image: 'images/person 2.png',
        time: '01:25',
        unreadCount: 1,
        isReceiveMess: false,
        isRead: false),
    Messages(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        image: 'images/person 2.png',
        time: '01:25',
        unreadCount: 0,
        isReceiveMess: true,
        isRead: true),
    Messages(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        image: 'images/person 2.png',
        time: '01:25',
        unreadCount: 0,
        isReceiveMess: true,
        isRead: true),
    Messages(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        image: 'images/person 2.png',
        time: '01:25',
        unreadCount: 3,
        isReceiveMess: false,
        isRead: false),
    Messages(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        image: 'images/person 2.png',
        time: '01:25',
        unreadCount: 5,
                isReceiveMess: false,

        isRead: false),
    Messages(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        image: 'images/person 2.png',
        time: '01:25',
        unreadCount: 0,
                isReceiveMess: false,

        isRead: true),
    Messages(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        image: 'images/person 2.png',
        time: '01:25',
        unreadCount: 0,
                isReceiveMess: false,

        isRead: true),
    
  ];