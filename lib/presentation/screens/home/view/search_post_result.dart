import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/consts.dart';

class SearchPostResult extends StatelessWidget {
  final String serviceAttachFile;
  final String userImg;
  final String userName;
  final String serviceName;
  final void Function()? onPressed;
  const SearchPostResult(
      {super.key,
      required this.serviceAttachFile,
      required this.userImg,
      required this.userName,
      required this.serviceName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 0.2 * Constants.screenHeight,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              elevation: MaterialStateProperty.all(8),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10))),
          onPressed: onPressed,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: serviceAttachFile,
                  width: Constants.screenWidth * 0.4,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) =>
                      Image.asset('images/placeholder.jpg'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        child: CachedNetworkImage(
                          imageUrl: userImg,
                          errorWidget: (context, url, error) =>
                              Image.asset('images/placeholder.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        userName,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 0.06 * Constants.screenHeight,
                    width: 0.4 * Constants.screenWidth,
                    child: Text(
                      serviceName,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
