import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/shimmer_widget.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.imgUrl,
      required this.catName,
      required this.numOfSkills});
  final String imgUrl;
  final String catName;
  final int numOfSkills;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return ShimmerWidget(
      enableShimmer: homeCubit.categoriesEnableShimmer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
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
            ),
            Text(
              catName,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.headlineSmall!.color,
              ),
            ),
            Text(
              numOfSkills.toString(),
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: const Color(0xffB1B1B1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
