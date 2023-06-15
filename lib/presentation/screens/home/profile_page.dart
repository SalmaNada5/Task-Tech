
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
        bool status = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * 0.03,
            end: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03,
            top: MediaQuery.of(context).size.height * 0.03),
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.12,
                    backgroundImage: const AssetImage(
                      'images/picture.png',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  Text(
                    'Eman Elsayed',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: const Color.fromRGBO(22, 80, 105, 1)),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Account',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: const Color.fromRGBO(38, 50, 56, 1)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Image.asset('icons/personal_info.png'),
                  label: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: MediaQuery.of(context).size.width * 0.02,
                      end: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Personal information',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  color: const Color.fromRGBO(38, 50, 56, 1)),
                            ),
                            const Spacer(),
                           /* SizedBox(
                              width: MediaQuery.of(context).size.width * 0.27,
                            ),*/
                            Icon(
                              Icons.arrow_forward_ios,
                              color: const Color.fromRGBO(38, 50, 56, 1),
                              size: MediaQuery.of(context).size.width * 0.038,
                            )
                          ],
                        ),
                        Text(
                          'Security, Privacy',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.038,
                              color: const Color.fromRGBO(177, 177, 177, 1)),
                        ),
                      ],
                    ),
                  )),
              Divider(
                height: MediaQuery.of(context).size.height * 0.04,
                thickness: 1,
                color: const Color.fromRGBO(224, 224, 224, 1),
                indent: 10,
                endIndent: 10,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/Group 34333.png'),
                label: Text(
                  'Message',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: const Color.fromRGBO(38, 50, 56, 1)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/Vector.png'),
                label: Text(
                  'Saved',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: const Color.fromRGBO(38, 50, 56, 1)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/Group 34337.png'),
                label: Text(
                  'Contact Us',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: const Color.fromRGBO(38, 50, 56, 1)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/credit.png'),
                label: Text(
                  'Payment',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: const Color.fromRGBO(38, 50, 56, 1)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/notification.png'),
                label: Text(
                  'Notifications',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: const Color.fromRGBO(38, 50, 56, 1)),
                ),
              ),
               Divider(
                height: MediaQuery.of(context).size.height * 0.043,
                thickness: 1,
                color: const Color.fromRGBO(224, 224, 224, 1),
                indent: 10,
                endIndent: 10,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/Vector-1.png'),
                label: Row(
                  children: [
                    Text(
                      'Dark mode',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          color: const Color.fromRGBO(38, 50, 56, 1)),
                    ),
                    const Spacer(),
FlutterSwitch(
            width: 50.0,
            height: 25.0,
            toggleSize: 18.0,
            value: status,
            inactiveColor : const Color.fromRGBO(224, 224, 224, 1),
            activeColor: const Color.fromRGBO(22, 80, 105, 1),
            borderRadius: 20.0,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),                  ],
                ),
              ),
               Divider(
                height: MediaQuery.of(context).size.height * 0.043,
                thickness: 1,
                color: const Color.fromRGBO(224, 224, 224, 1),
                indent: 10,
                endIndent: 10,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/edit.png'),
                label: Text(
                  'Edit profile',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: const Color.fromRGBO(38, 50, 56, 1)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset('icons/Group 34341.png'),
                label: Text(
                  'Sign Out',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: const Color.fromRGBO(38, 50, 56, 1)),
                ),
              ),

              
            ]),
          ),
        ),
      ),
    );
  }
}
