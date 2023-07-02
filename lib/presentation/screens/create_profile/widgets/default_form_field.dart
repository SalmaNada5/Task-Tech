import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.controller,
    this.suffix,
    this.type,
    required this.validate,
  }) : super(key: key);
  final TextEditingController? controller;
  final Widget? suffix;
  final TextInputType? type;
  final String? Function(String?)? validate;
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
        
        suffixIcon: suffix,
        suffixIconColor: const Color(0xffB1B1B1),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
borderSide: const BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
          borderRadius: BorderRadius.circular(10),                    
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validate,
    );
  }
}




