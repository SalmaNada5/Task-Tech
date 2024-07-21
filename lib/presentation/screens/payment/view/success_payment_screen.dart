import 'package:task_tech/presentation/screens/payment/controller/review_controller.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/service_details_controller.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/task_details_controller.dart';
import 'package:task_tech/utils/exports.dart';

class CongratesScreen extends StatelessWidget {
  const CongratesScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(const EdgeInsets.all(4)),
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).primaryColor),
              shape: WidgetStatePropertyAll(
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
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('images/congrates.png'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Congratulations',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your order was placed successfully.',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: const Color(0xff7C7C7C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: const BottomSheetWidget(),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PaymentCubit paymentCubit =
        BlocProvider.of<PaymentCubit>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.of(context).size.height * 0.6,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'What is your rate?',
                                style: GoogleFonts.poppins(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SmoothStarRating(
                                rating: paymentCubit.rate?.toDouble() ?? 0.0,
                                size: 30,
                                filledIconData: Icons.star,
                                defaultIconData: Icons.star_border,
                                halfFilledIconData: Icons.star_half,
                                starCount: 5,
                                spacing: 2,
                                color: const Color.fromRGBO(255, 193, 7, 1),
                                borderColor:
                                    const Color.fromRGBO(218, 218, 218, 1),
                                onRatingChanged: (rating) {
                                  paymentCubit.onRatingChanged(rating);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        color:
                                            Color.fromRGBO(224, 224, 224, 0.9),
                                      ),
                                      BoxShadow(
                                        offset: Offset(-2, -2),
                                        color:
                                            Color.fromRGBO(224, 224, 224, 0.9),
                                      ),
                                    ]),
                                child: TextField(
                                  minLines: 6,
                                  maxLines: 10,
                                  controller: paymentCubit.reviewController,
                                  onChanged: (value) {
                                    paymentCubit.reviewController.text = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Your review',
                                    hintStyle: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(
                                          124, 124, 124, 0.72),
                                      fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.all(10),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () async {
                                  logInfo(
                                      'rate: $paymentCubit.rate, review: ${paymentCubit.reviewController.text} , curUserId: ${CurrentUserInfoController.userInfoModel.data?.user.id ?? ''} , usermadeTaskId: ${TaskController.taskDetailsModel.data?.post.user?.id ?? ''}');
                                  await ReviewController.addReviewFunc(
                                      paymentCubit.rate ?? 0,
                                      paymentCubit.reviewController.text,
                                      ServiceController.serviceDetailsModel.data
                                              ?.service?.user.id ??
                                          '',
                                      CurrentUserInfoController
                                              .userInfoModel.data?.user.id ??
                                          '');
                                  Constants.navigateTo(
                                      const BottomNavBarScreen());
                                },
                                style: ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                      const EdgeInsets.symmetric(
                                          horizontal: 60, vertical: 15)),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Theme.of(context).primaryColor),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Done',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor:
                    WidgetStatePropertyAll(Theme.of(context).primaryColor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Add review',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Constants.navigateTo(const BottomNavBarScreen(),
                    pushReplacment: true);
              },
              style: ButtonStyle(
                side: WidgetStatePropertyAll(BorderSide(
                  color: Theme.of(context).primaryColor,
                )),
                padding: WidgetStatePropertyAll(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Skip',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
