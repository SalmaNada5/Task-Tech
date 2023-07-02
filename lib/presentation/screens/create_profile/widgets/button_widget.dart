import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle labelFormStyle = GoogleFonts.poppins(
    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      this.onpressed,
      this.borderColor,
      required this.childWidget});
  final double width;
  final double height;
  final Color color;
  final Color? borderColor;
  final void Function()? onpressed;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          //const Color.fromRGBO(22, 80, 105, 1),
          borderRadius: BorderRadius.circular(6),
          border:Border.all(color: borderColor==null ? Colors.transparent: borderColor!) 
          //Border.all(color: const Color.fromRGBO(22, 80, 105, 1))
          ),
      child: MaterialButton(
        onPressed: onpressed,
        child: childWidget,
      ),
    );
  }
}
