import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/auth/controller/cur_user_controller.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          CurrentUserInfoController.userInfoModel.data?.user.reviews.length ?? 0,
      itemBuilder: (context, i) => reviewCard(
        name: CurrentUserInfoController
                .userInfoModel.data?.user.reviews[i].reviewer?.name ??
            '',
        review: CurrentUserInfoController
                .userInfoModel.data?.user.reviews[i].review ??
            '',
        rate: CurrentUserInfoController
                .userInfoModel.data?.user.reviews[i].rating ??
            0.0,
        imgUrl: CurrentUserInfoController
                .userInfoModel.data?.user.reviews[i].reviewer?.photo ??
            '',
      ),
      //   children: [
      //   reviewCard(
      //       name: 'Emily',
      //       review: 'Nice work and user friendly communication.',
      //       rate: 4.5),
      //   reviewCard(
      //       name: 'Emily',
      //       review: 'very patient and awesome to work with!'
      //           'asked the right question about the target'
      //           'audience and made exactly what we '
      //           'needed!',
      //       rate: 4.5),
      //   reviewCard(
      //       name: 'Emily',
      //       review: 'very patient and awesome to work with!'
      //           'asked the right question about the target'
      //           'audience and made exactly what we '
      //           'needed!',
      //       rate: 4.5)
      // ]);
    );
  }
}

Widget reviewCard(
    {required String name,
    required String review,
    required num rate,
    required String imgUrl}) {
  return ListTile(
    leading: CircleAvatar(
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          errorWidget: (context, url, error) {
            return Image.asset(
              'images/placeholder.jpg',
            );
          },
        ),
      ),
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
          style: GoogleFonts.poppins(
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
