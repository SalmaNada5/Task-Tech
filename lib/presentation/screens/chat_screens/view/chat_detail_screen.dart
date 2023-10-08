import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool isOnline = true;
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        messageIsRead: true),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Hi Kristin! \n Yes, I just finished developing the \"Chat\" .",
        messageType: "sender",
        messageIsRead: false),
  ];
  late io.Socket socket;
  connectSocket() {
    socket.onConnect((data) => debugPrint('connection established'));
    socket.onConnectError((data) => debugPrint('connection error: $data'));
    socket.onDisconnect((data) => debugPrint('Socket IO server disconnected'));
    socket.on('message', (data) => debugPrint(data));
  }

  String? currentUserId;

  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    currentUserId = pref.getString('id');
  }

  sendMessages() {
    socket.emit('message', {
      'message': messageController.text,
      'senderID': currentUserId,
    });
  }

  List<String> msgs = [];

  @override
  void initState() {
    messageController = TextEditingController();
    socket = io.io(
        'https://task-teck.onrender.com/',
        io.OptionBuilder().setTransports(['websocket']).setQuery({
          'id': currentUserId,
        }).build());
    connectSocket();
    //initTheSocket();
    super.initState();
  }

  // initTheSocket() {
  //   socket = IO.io('https://task-teck.onrender.com/', {
  //     'transports': ['websocket'],
  //     'autoConnect': false
  //   });
  //   socket.connect();
  //   // ignore: avoid_print
  //   socket.onConnect((_) => print('connected with server'));
  //   // ignore: avoid_print
  //   print(socket.connected);

  //   socket.onDisconnect((_) => debugPrint("disconnected with server"));

  //   socket.on('res', (data) {
  //     debugPrint(data);
  //     setState(() {
  //       msgs.add(data);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 85,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 16, end: 16, top: 5),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 2,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('images/person 2.png'),
                            maxRadius: 25,
                          ),
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: isOnline
                                ? const Color.fromRGBO(76, 175, 80, 1)
                                : Colors.transparent,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Kristin Waston',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            Text(isOnline ? "Online" : "Offline",
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromRGBO(149, 149, 149, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                  child: Container(
                    color: const Color.fromRGBO(218, 218, 218, 1),
                    width: double.infinity,
                    height: 1,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: Stack(
            children: [
              ListView.builder(
                  itemCount: msgs.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 14, end: 14, top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(15),
                                      topRight: const Radius.circular(15),
                                      bottomLeft: messages[index].messageType ==
                                              "receiver"
                                          ? Radius.zero
                                          : const Radius.circular(15),
                                      bottomRight:
                                          messages[index].messageType ==
                                                  "sender"
                                              ? Radius.zero
                                              : const Radius.circular(15)),
                                  color:
                                      (messages[index].messageType == "receiver"
                                          ? const Color.fromRGBO(22, 80, 105, 1)
                                          : Colors.transparent),
                                  border: Border.all(
                                      color: messages[index].messageType ==
                                              "receiver"
                                          ? const Color.fromRGBO(22, 80, 105, 1)
                                          : const Color.fromRGBO(
                                              232, 233, 235, 1))),
                              padding: const EdgeInsets.all(14),
                              child: Wrap(
                                verticalDirection: VerticalDirection.down,
                                alignment: WrapAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.005),
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.80,
                                    ),
                                    child: Text(
                                      msgs[index],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color:
                                              // messages[index].messageType == "receiver"?
                                              // Color.fromRGBO(255, 255, 255, 1):
                                              const Color.fromRGBO(
                                                  89, 95, 105, 1)),
                                    ),
                                  ),
                                  //messages[index].messageType == "sender"?
                                  Container(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    margin: EdgeInsetsDirectional.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: Icon(
                                      //messages[index].messageIsRead==true?
                                      Icons.done_all_rounded,
                                      //: Icons.done,
                                      size: MediaQuery.of(context).size.width *
                                          0.04,
                                      color:
                                          const Color.fromRGBO(22, 80, 105, 1),
                                    ),
                                  )
                                  //:SizedBox(width: 0),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment:
                                //(messages[index].messageType == 'receiver'?
                                Alignment.topLeft,
                            // : Alignment.topRight),
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.006,
                                  left: MediaQuery.of(context).size.width *
                                      0.015),
                              //alignment: Alignment.bottomRight,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.20,
                              ),
                              child: Text(
                                '11:11',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(138, 144, 153, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 15, end: 15, bottom: 15),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('icons/paperclip.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 35,
                        width: double.infinity * 0.5,
                        child: TextField(
                          controller: messageController,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color.fromRGBO(15, 24, 40, 1)),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsetsDirectional.all(10),
                              labelStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color.fromRGBO(15, 24, 40, 1),
                              ),
                              filled: true,
                              focusColor:
                                  const Color.fromRGBO(247, 247, 252, 1),
                              hoverColor:
                                  const Color.fromRGBO(247, 247, 252, 1),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              fillColor: Theme.of(context).canvasColor),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          if (messageController.text.isNotEmpty) {
                            sendMessages();
                            debugPrint('senttt');
                          }
                          // setState(() {
                          //   socket.emit('msg', messageController!.text);
                          //   msgs.add(messageController!.text);
                          //   messageController!.clear();
                          // });
                        },
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  // void sendMessage(String text) {
  //   var messageJson = {"message": text, "sentByMe": socket.id};
  //   socket.emit('message', messageJson);
  // }

  // void setUpSocketListner() {
  //   socket.on('message-receive', (data) {});
  // }
}

class ChatMessage {
  String messageContent;
  String messageType;
  bool messageIsRead;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      this.messageIsRead = true});
}
