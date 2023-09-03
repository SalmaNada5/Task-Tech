import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/payment/controller/payment_controller.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/service_details_controller.dart';
import 'package:task_tech/presentation/screens/payment/view/payment_web_view.dart';
import '../../home/models/search_service_model.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Service? service;
  const ServiceDetailsPage({
    super.key,
    this.service,
  });

  @override
  Widget build(BuildContext context) {
    logInfo(
        "Service ID ${ServiceController.serviceDetailsModel.data?.service.id}");
    SharedPreferences.getInstance().then((value) {
      logWarning("Token : ${value.getString('token')}");
    });
    dynamic serviceItem =
        service ?? ServiceController.serviceDetailsModel.data?.service;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
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
            serviceItem == null
                ? const SizedBox.shrink()
                : Image.network(
                    serviceItem.attachFile ?? "",
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
                          backgroundImage:
                              NetworkImage(serviceItem?.user?.photo ?? ""),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          serviceItem?.user?.name ?? "",
                          style: headStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      serviceItem?.name ?? "",
                      style: headStyle,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      serviceItem?.description ?? "",
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
                          serviceItem?.delieveryDate ?? "",
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
                      serviceItem?.category ?? "",
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
                      '${serviceItem?.softwareTool}',
                      style: postDescriptionStyle.copyWith(fontSize: 15),
                    ),
                  ]),
            ),
            ElevatedButton(
              onPressed: () async {
                String? serviceId = serviceItem?.id;
                await PaymentController.paymentFunc(serviceId);
                String url = '';
                url = PaymentController.paymentModel.session?.url ?? '';
                logInfo(url);
                Constants.navigateTo(WebViewPage(
                  url: url,
                ));
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 14)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Continue (\$${serviceItem?.salary})',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
