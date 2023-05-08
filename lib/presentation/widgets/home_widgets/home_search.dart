import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: Image.asset('images/search.png'),
        suffixIcon: Image.asset('images/filter.png'),
        hintText: 'what are you looking for?',
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xffC0C0C0),
        ),
        fillColor: const Color(0xffF5F5F5),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffB8B8B8)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffB8B8B8)),
          borderRadius: BorderRadius.circular(10),
        ),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        _searchController.text = value.toString();
        _searchController.selection =
            TextSelection.collapsed(offset: _searchController.text.length);
      },
    );
  }
}
