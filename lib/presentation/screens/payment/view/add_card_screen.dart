import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/text_styles.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController cardNumberController = TextEditingController();
    TextEditingController cardHolderNameController = TextEditingController();
    TextEditingController cvvController = TextEditingController();
    TextEditingController expirationDateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        title: Text(
          'Add New Card',
          style: titleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            ReusableFormField(
              controller: cardNumberController,
              hint: 'Card Number',
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableFormField(
              controller: cardHolderNameController,
              hint: 'Card Holder Name',
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expiration Date',
                      style: headStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ReusableFormField(
                          controller: expirationDateController, hint: 'MM/YY'),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CVV',
                      style: headStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ReusableFormField(
                        controller: cvvController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Pay Now',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableFormField extends StatelessWidget {
  const ReusableFormField({super.key, required this.controller, this.hint});
  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
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
        controller.text = value.toString();
        controller.selection =
            TextSelection.collapsed(offset: controller.text.length);
      },
    );
  }
}
