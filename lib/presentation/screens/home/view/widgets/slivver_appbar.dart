import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/shimmer_widget.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';
import 'package:task_tech/presentation/screens/home/view/notifications_screen.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 70,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    child: ClipOval(
                      child: ShimmerWidget(
                        enableShimmer: homeCubit.userInfoEnableShimmer,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeCubit.userInfoModel.data?.user.photo ?? '',
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              'images/placeholder.jpg',
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back!',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color(0xff7C7C7C),
                        ),
                      ),
                      Text(
                        homeCubit.userInfoModel.data?.user.name ?? '',
                        style: titleStyle.copyWith(fontSize: 22),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Constants.navigateTo(const NotificationsScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset('images/notifications.png'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
