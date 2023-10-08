import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/service_details_controller.dart';
import 'package:task_tech/presentation/screens/posts_details/view/service_details.dart';
import 'package:task_tech/presentation/screens/posts_details/view/task_details.dart';

class ReusablePostWidget extends StatelessWidget {
  const ReusablePostWidget({
    super.key,
    required this.profileImgUrl,
    required this.accountName,
    required this.postDescription,
    required this.postTime,
    required this.dropDownVal,
    this.taskId,
    this.serviceId,
  });
  final String profileImgUrl;
  final String accountName;
  final String postDescription;
  final String postTime;
  final String dropDownVal;
  final String? taskId;
  final String? serviceId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(right: 10, top: 4, left: 10),
      height: MediaQuery.of(context).size.height * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Constants.isDarkMode
            ? const Color(0xff213440)
            : const Color(0xffF5F5F5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: CircleAvatar(
                  child: CachedNetworkImage(
                      imageUrl: profileImgUrl,
                      errorWidget: (context, url, error) {
                        return Image.asset('images/placeholder.jpg');
                      }),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                accountName,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                postTime,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Text(
              postDescription,
              softWrap: true,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: postDescriptionStyle,
            ),
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  if (dropDownVal == 'Tasks') {
                    Constants.navigateTo(TaskDetailsPage(
                      postId: taskId!,
                    ));
                  } else {
                    await ServiceController.getServiceFunc(serviceId ?? "");
                    Constants.navigateTo(const ServiceDetailsPage());
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    dropDownVal == 'Tasks' ? 'View Task' : 'View Service',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
