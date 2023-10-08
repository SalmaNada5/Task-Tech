import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/auth/view/sign_in_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/view/screens/create_profile.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';
import 'package:task_tech/presentation/screens/profile/view/profile_cubit/profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit =
        BlocProvider.of<ProfileCubit>(context, listen: true);
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    final manager = AdaptiveTheme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (p, c) => c is HomeInitial || c is GetUserInfoSucces,
                bloc: homeCubit,
                builder: (context, state) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                state.userInfoModel?.data?.user.photo ?? '',
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                'images/placeholder.jpg',
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        state.userInfoModel?.data?.user.name ?? '',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
              Text(
                'Account',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.person_crop_circle,
                    color: Theme.of(context).textTheme.headlineSmall!.color,
                  ),
                  label: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Personal information',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .color,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: const Color.fromRGBO(38, 50, 56, 1),
                              size: MediaQuery.of(context).size.width * 0.038,
                            )
                          ],
                        ),
                        Text(
                          'Security, Privacy',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color.fromRGBO(177, 177, 177, 1)),
                        ),
                      ],
                    ),
                  )),
              const Divider(
                height: 4,
                thickness: 1,
                color: Color.fromRGBO(224, 224, 224, 1),
                indent: 10,
                endIndent: 10,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.chat_bubble_2,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Messages',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bookmark,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Saved',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.mail_outline_rounded,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Contact Us',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.creditcard,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Payment',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Notifications',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                color: Color.fromRGBO(224, 224, 224, 1),
                indent: 10,
                endIndent: 10,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Text(
                        'Dark mode',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color:
                              Theme.of(context).textTheme.headlineSmall!.color,
                        ),
                      ),
                    ),
                    const Spacer(),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return FlutterSwitch(
                          width: 50.0,
                          height: 25.0,
                          toggleSize: 18.0,
                          value: profileCubit.status,
                          inactiveColor: const Color(0xff6695A0),
                          activeColor: const Color.fromRGBO(224, 224, 224, 1),
                          borderRadius: 20.0,
                          onToggle: (val) {
                            profileCubit.onThemeModeSwitched(val);
                            if (profileCubit.status) {
                              manager.setLight();
                            } else {
                              manager.setDark();
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                color: Color.fromRGBO(224, 224, 224, 1),
                indent: 10,
                endIndent: 10,
              ),
              TextButton.icon(
                onPressed: () => Constants.navigateTo(const CreateProfile()),
                icon: Icon(
                  Icons.edit_document,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Edit profile',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              TextButton.icon(
                onPressed: () async {
                  final shared = await SharedPreferences.getInstance();
                  shared.clear();
                  Constants.navigateTo(const SignInScreen(),
                      pushAndRemoveUntil: true);
                },
                icon: Icon(
                  Icons.logout,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                label: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
