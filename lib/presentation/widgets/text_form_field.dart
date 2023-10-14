import 'package:task_tech/utils/exports.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.icon,
    this.keyboardType,
    required this.obscure,
    required this.validator,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final IconButton? icon;
  final TextInputType? keyboardType;
  final bool obscure;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.poppins(
        color: Theme.of(context).textTheme.headlineSmall!.color,
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
        fillColor: fillColor ?? Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.white),
        //   borderRadius: BorderRadius.circular(10),
        // ),
      ),
      obscureText: obscure,
      validator: validator,
    );
  }
}
