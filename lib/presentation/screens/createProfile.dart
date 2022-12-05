import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:task_tech/constants/colors.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});


  @override
  State<CreateProfile> createState() => _CreateProfileState();
  
}

class _CreateProfileState extends State<CreateProfile> {

late AnimationController controller;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 70,
        backgroundColor: white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context){
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                  onPressed: (){},
                  icon: Image.asset('icons/profile.png')),
            );
          },
        ) ,
          title: const Padding(
            padding:  EdgeInsets.all(60.0),
            child: Text(
              'Create Profile',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black
              ),
            ),
          ),


      ),
      body: Column(
        children: [
         RoundedProgressBar(
           height: 12,
           style: RoundedProgressBarStyle(
             widthShadow: 0,
             borderWidth: 0,
             colorProgress: primaryLightColor,
             backgroundProgress: Colors.grey
           ),
         )

        ],
      ),
    );
  }
}