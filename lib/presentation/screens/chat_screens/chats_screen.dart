import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/chat_screens/chat_detail_screen.dart';

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;

  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time});
}

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
        ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30'),
    ChatUsers(
        name: 'Kristin Waston',
        messageText: 'Yes, the work is all done',
        imageURL: 'images/person 2.png',
        time: '12:30')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'icons/bi_arrow-left-circle-fill.png',
            width: 40,
            height: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(22, 80, 105, 1),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 15, end: 15, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: Image.asset('images/search.png'),
                    suffixIcon: Image.asset('images/filter.png'),
                    hintText: 'Search message..',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffC0C0C0),
                    ),
                    fillColor: const Color(0xffF5F5F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffB8B8B8)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffB8B8B8)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    _searchController.text = value.toString();
                    _searchController.selection = TextSelection.collapsed(
                        offset: _searchController.text.length);
                  },
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: chatUsers.length,
                  itemBuilder: (context, index) {
                    return ConversationList(
                        name: chatUsers[index].name,
                        messageText: chatUsers[index].messageText,
                        imageURL: chatUsers[index].imageURL,
                        time: chatUsers[index].time,
                        isMessaged: (index == 1 || index == 4) ? true : false,
                        numMessage: (index == 1 || index == 4) ? null : 1,);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageURL;
  String time;
  bool isMessaged;
  int? numMessage;

  ConversationList(
      {super.key,
      required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time,
      required this.isMessaged,
      required this.numMessage});

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
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
                            color: widget.isMessaged
                                ? const Color.fromRGBO(124, 124, 124, 0.81)
                                : const Color.fromRGBO(39, 102, 207, 1)),
                      )
                    ],
                  ),
                ))
              ],
            )),
            Column(
              children: [
                Text(
                  widget.time,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(124, 124, 124, 0.81)),
                ),
                const SizedBox(height: 5,),
                (widget.numMessage==1)?
                 CircleAvatar(
                            radius: 9,
                            backgroundColor:const Color.fromRGBO(39, 102, 207, 1),
                            child: Text(widget.numMessage.toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10.2,
                              fontWeight: FontWeight.w500
                            ),),
                          ):
                          const Icon(Icons.done_all,
                          color: Color.fromRGBO(149, 149, 149, 1),
                          size: 18,
                          )
              ],
            )
          ],
        ),
      ),
    );
  }
}
