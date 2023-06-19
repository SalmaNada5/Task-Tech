import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 5),
          child: IconButton(
            
            icon: Image.asset('icons/bi_arrow-left-circle-fill.png', ),
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
                      image: AssetImage('images/Group 34355.png'))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                'You don’t have any notifications yet',
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
    );
  }
}