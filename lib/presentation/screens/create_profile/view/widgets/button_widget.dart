import 'package:flutter/material.dart';
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
          borderRadius: BorderRadius.circular(6),
          border:Border.all(color: borderColor==null ? Colors.transparent: borderColor!) 
          ),
      child: MaterialButton(
        onPressed: onpressed,
        child: childWidget,
      ),
    );
  }
}
