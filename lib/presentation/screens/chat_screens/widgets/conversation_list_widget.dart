import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/chat_screens/view/chat_detail_screen.dart';


class ConversationList extends StatefulWidget {
  final String name;
  final String messageText;
  final String imageURL;
  final String time;
  final bool isRead;
  final int? unreadCount;
  final bool isReceiveMess;

  const ConversationList(
      {super.key,
      required this.name,
      required this.isReceiveMess,
      required this.messageText,
      required this.imageURL,
      required this.time,
      required this.isRead,
      required this.unreadCount});

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ChatDetailScreen();
        }));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.imageURL),
                  maxRadius: 30,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.messageText,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: widget.isRead
                                ? const Color.fromRGBO(124, 124, 124, 0.81)
                                : const Color.fromRGBO(39, 102, 207, 1)),
                      )
                    ],
                  ),
                ))
              ],
            )),
           // const Spacer(),
            Column(
              children: [
                Text(
                  widget.time,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(124, 124, 124, 0.81)),
                ),
                const SizedBox(
                  height: 5,
                ),
                (widget.unreadCount! > 0)
                    ? CircleAvatar(
                        radius: 9,
                        backgroundColor: const Color.fromRGBO(39, 102, 207, 1),
                        child: Text(
                          widget.unreadCount.toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10.2,
                              fontWeight: FontWeight.w500),
                        ),
                      ):widget.isReceiveMess==false?
                     const Icon(
                        Icons.done_all,
                        color: Color.fromRGBO(149, 149, 149, 1),
                        size: 18,
                      ):Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
