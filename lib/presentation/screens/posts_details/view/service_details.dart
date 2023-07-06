import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/payment/order_review_screen.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/service_details_controller.dart';
import '../../../../constants/colors.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    logInfo(
        "ServiCE ID ${ServiceController.serviceDetailsModel.data?.service.id}");
    SharedPreferences.getInstance().then((value) {
      logWarning("Token : ${value.getString('token')}");
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              backgroundColor: MaterialStateProperty.all(primaryLightColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        title: Text(
          'Service',
          style: titleStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceController.serviceDetailsModel.data == null
                ? const SizedBox.shrink()
                : Image.network(
                    ServiceController
                            .serviceDetailsModel.data?.service.attachFile ??
                        "",
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(ServiceController
                                  .serviceDetailsModel
                                  .data
                                  ?.service
                                  .user
                                  .photo ??
                              ""),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ServiceController.serviceDetailsModel.data?.service
                                  .user.name ??
                              "",
                          style: headStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      ServiceController
                              .serviceDetailsModel.data?.service.name ??
                          "",
                      style: headStyle,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      ServiceController
                              .serviceDetailsModel.data?.service.description ??
                          "",
                      style: postDescriptionStyle,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text('Delivery Days',
                            style: titleStyle.copyWith(
                              fontSize: 15,
                            )),
                        const Spacer(),
                        Text(
                          ServiceController.serviceDetailsModel.data?.service
                                  .delieveryDate ??
                              "",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff7C7C7C),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Category',
                      style: titleStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      ServiceController
                              .serviceDetailsModel.data?.service.category ??
                          "",
                      style: postDescriptionStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Software Tools',
                      style: titleStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${ServiceController.serviceDetailsModel.data?.service.softwareTool}',
                      style: postDescriptionStyle.copyWith(fontSize: 15),
                    ),
                  ]),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => OrderReviewScreen(
                          imgUrl: ServiceController.serviceDetailsModel.data
                                  ?.service.attachFile ??
                              "",
                          serviceName: ServiceController
                                  .serviceDetailsModel.data?.service.name ??
                              "",
                          rate: 2.4,
                          deliveryDate: ServiceController.serviceDetailsModel
                                  .data?.service.delieveryDate ??
                              "",
                          price: 50))),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 14)),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Continue (\$${ServiceController.serviceDetailsModel.data?.service.salary})',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
