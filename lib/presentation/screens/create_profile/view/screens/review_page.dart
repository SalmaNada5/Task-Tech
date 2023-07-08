import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      
      reviewCard(
          name: 'Emily',
          review: 'Nice work and user friendly communication.',
          rate: 4.5),
      reviewCard(
          name: 'Emily',
          review: 'very patient and awesome to work with!'
              'asked the right question about the target'
              'audience and made exactly what we '
              'needed!',
          rate: 4.5),
      reviewCard(
          name: 'Emily',
          review: 'very patient and awesome to work with!'
              'asked the right question about the target'
              'audience and made exactly what we '
              'needed!',
          rate: 4.5)
    ]);
  }
}

Widget reviewCard(
    {required String name, required String review, required double rate}) {
  return ListTile(
    leading: const CircleAvatar(
      backgroundImage: AssetImage('images/person.png'),
      //radius: 37.5,
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Color.fromRGBO(255, 193, 7, 1),
          size: 25,
        ),
        Text(
          '$rate',
          style:  GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(255, 193, 7, 1),
          ),
        )
      ],
    ),
    title: Padding(
      padding: const EdgeInsetsDirectional.only(top: 20.0),
      child: Text(
        name,
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ),
    isThreeLine: true,
    subtitle: Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.0),
      child: Text(
        review,
        style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(124, 124, 124, 1)),
      ),
    ),
  );
}
