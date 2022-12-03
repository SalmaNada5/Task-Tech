import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_tech/constants/colors.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle});
  final String? img;
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img!),
        const SizedBox(
          height: 20,
        ),
        Text(
          title!,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          subtitle!,
          softWrap: true,
          style: const TextStyle(
              color: Color(0xff95969D),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
