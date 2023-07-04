import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/presentation/screens/home/view/home_screen.dart';

class CongratesScreen extends StatelessWidget {
  const CongratesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController reviewController = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
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
                color: primaryLightColor,
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
      bottomSheet: BottomSheetWidget(reviewController: reviewController),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.reviewController,
  });

  final TextEditingController reviewController;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  double rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) => Dialog(
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
                                    color: primaryLightColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SmoothStarRating(
                                  rating: rate,
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
                                    setState(() {
                                      rate = rating;
                                    });
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
                                          color: Color.fromRGBO(
                                              224, 224, 224, 0.9),
                                        ),
                                        BoxShadow(
                                          offset: Offset(-2, -2),
                                          color: Color.fromRGBO(
                                              224, 224, 224, 0.9),
                                        ),
                                      ]),
                                  child: TextField(
                                    minLines: 6,
                                    maxLines: 10,
                                    controller: widget.reviewController,
                                    decoration: InputDecoration(
                                      hintText: 'Your review',
                                      hintStyle: GoogleFonts.poppins(
                                        color: const Color.fromRGBO(
                                            124, 124, 124, 0.72),
                                        fontSize: 16,
                                      ),
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: white,
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 60, vertical: 15)),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryLightColor),
                                    shape: MaterialStateProperty.all(
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
                        ),
                      );
                    });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                shape: MaterialStateProperty.all(
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
                Constants.navigateTo(const HomeScreen(), pushReplacment: true);
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(
                  color: primaryLightColor,
                )),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
                backgroundColor: MaterialStateProperty.all(white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Skip',
                style: GoogleFonts.poppins(
                  color: primaryLightColor,
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
