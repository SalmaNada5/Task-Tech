import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.icon,
    this.keyboardType,
    required this.obscure,
    required this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final IconButton? icon;
  final TextInputType? keyboardType;
  final bool obscure;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      onChanged: (value) {
        controller!.text = value.toString();
        controller!.selection =
            TextSelection.collapsed(offset: controller!.text.length);
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xffB1B1B1),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: icon,
        suffixIconColor: const Color(0xffB1B1B1),
        fillColor: const Color(0xffF5F5F5),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: obscure,
      validator: validator,
    );
  }
}
