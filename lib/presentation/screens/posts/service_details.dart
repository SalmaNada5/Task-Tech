import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/payment/order_review_screen.dart';

import '../../../constants/colors.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({
    super.key,
    required this.userName,
    required this.imgUrl,
    required this.serviceName,
    required this.description,
    required this.deliveryDays,
    required this.category,
    required this.softwareTools,
    required this.price,
    required this.attachedFileUrl,
    required this.deliveryDate,
    required this.rate,
  });
  final String userName;
  final String imgUrl;
  final String serviceName;
  final String description;
  final String deliveryDays;
  final String category;
  final String softwareTools;
  final double price;
  final String attachedFileUrl;
  final String deliveryDate;
  final double rate;
  @override
  Widget build(BuildContext context) {
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
            Image.network(
              imgUrl,
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
                          backgroundImage: NetworkImage(imgUrl),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          userName,
                          style: headStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      serviceName,
                      style: headStyle,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      description,
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
                          deliveryDays,
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
                      category,
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
                      softwareTools,
                      style: postDescriptionStyle.copyWith(fontSize: 15),
                    ),
                  ]),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => OrderReviewScreen(
                          imgUrl: imgUrl,
                          serviceName: serviceName,
                          rate: rate,
                          deliveryDays: deliveryDays,
                          deliveryDate: deliveryDate,
                          price: price))),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Continue (\$$price)',
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
