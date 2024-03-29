import 'package:flutter/cupertino.dart';
import 'package:task_tech/presentation/screens/home/view/screens/notifications_screen.dart';
import 'package:task_tech/utils/exports.dart';
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
                    foregroundColor: Theme.of(context).primaryColor,
                    radius: 26,
                    child: ClipOval(
                      child: ShimmerWidget(
                        enableShimmer: homeCubit.userInfoEnableShimmer,
                        child: CachedNetworkImage(
                          imageUrl: state.userInfoModel?.data?.user.photo ?? '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              'images/placeholder.jpg',
                              fit: BoxFit.fill,
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
                        state.userInfoModel?.data?.user.name ?? '',
                        style: titleStyle.copyWith(
                            fontSize: 22,
                            color: Theme.of(context).primaryColor),
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
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Icon(
                          CupertinoIcons.bell,
                          size: 26,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
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
