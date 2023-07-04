import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/service_details_controller.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/task_details_controller.dart';
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
    required this.taskId,
    required this.serviceId,
  });
  final String profileImgUrl;
  final String accountName;
  final String postDescription;
  final String postTime;
  final String dropDownVal;
  final String taskId;
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffF5F5F5),
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
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                postTime,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xff1B2936),
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
                onPressed: () {
                  if (dropDownVal == 'Tasks') {
                    TaskController.getTaskFunc(taskId);
                    Constants.navigateTo(TaskDetailsPage(
                      userImg:
                          TaskController.taskDetailsModel.data!.post.user.photo,
                      name:
                          TaskController.taskDetailsModel.data!.post.user.name,
                      taskName: TaskController.taskDetailsModel.data!.post.name,
                      description: TaskController
                          .taskDetailsModel.data!.post.description,
                      price: TaskController.taskDetailsModel.data!.post.salary
                          .toInt(),
                      deliveryTime: TaskController
                          .taskDetailsModel.data!.post.delieveryDate,
                      postTime:
                          TaskController.taskDetailsModel.data!.post.createdAt,
                    ));
                  } else {
                    ServiceController.getServiceFunc(serviceId);
                    Constants.navigateTo(const ServiceDetailsPage());
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(primaryLightColor),
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