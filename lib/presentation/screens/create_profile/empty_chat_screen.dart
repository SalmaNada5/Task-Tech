
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyChatScreen extends StatefulWidget {
  const EmptyChatScreen({super.key});

  @override
  State<EmptyChatScreen> createState() => _EmptyChatScreenState();
}

class _EmptyChatScreenState extends State<EmptyChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('icons/bi_arrow-left-circle-fill.png'),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Inbox',
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
      body: Center(
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 15, end: 15, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              const Center(
                  child: Image(
                      image: AssetImage('images/Group Chat-amico 1.png'))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                'No messages yet',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Start a conversation with freelancers, '
                'and get the job done',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('icons/home.png')),
          label: 'home'),
          BottomNavigationBarItem(
          icon:Icon(Icons.textsms_rounded,
          color: Color.fromRGBO(177, 177, 177, 1),) ,
          //Image(image: AssetImage('icons/chat.png')),
          label: 'chat'),
          BottomNavigationBarItem(
          icon: Image(image: AssetImage('icons/add post.png')),
          label: 'add post'),
          BottomNavigationBarItem(
          icon: Image(image: AssetImage('icons/post.png')),
          label: 'posts'),
          BottomNavigationBarItem(
          icon: Image(image: AssetImage('icons/profile2.png')),
          label: 'profile'),


      ]),
    );
  }
}
