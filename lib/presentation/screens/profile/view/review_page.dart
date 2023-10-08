import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';

class ReviewPage extends StatelessWidget {
  final bool isMe;
  const ReviewPage({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      buildWhen: (p, c) => c is GetUserInfoSucces || c is GetSpecificUserSucces,
      builder: (context, state) {
        return ListView.builder(
          itemCount: isMe
              ? state.userInfoModel?.data?.user.reviews!.length ?? 0
              : homeCubit.userModel.data?.user.reviews?.length ?? 0,
          itemBuilder: (context, i) => reviewCard(
              name: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].reviewer!
                          .name ??
                      ''
                  : homeCubit
                          .userModel.data?.user.reviews?[i]?.reviewer!.name ??
                      '',
              review: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].review ?? ''
                  : homeCubit.userModel.data?.user.reviews?[i]?.review ?? '',
              rate: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].rating ?? 0.0
                  : homeCubit.userModel.data?.user.reviews?[i]?.rating ?? 0.0,
              imgUrl: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].reviewer!
                          .photo ??
                      ''
                  : homeCubit
                          .userModel.data?.user.reviews?[i]?.reviewer!.photo ??
                      '',
              textColor: Theme.of(context).textTheme.headlineSmall!.color!),
        );
      },
    );
  }
}

Widget reviewCard(
    {required String name,
    required String review,
    required num rate,
    required String imgUrl,
    required Color textColor}) {
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
            fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
      ),
    ),
    isThreeLine: true,
    subtitle: Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.0),
      child: Text(
        review,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
      ),
    ),
  );
}
