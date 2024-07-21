import 'package:task_tech/utils/exports.dart';

class UnexpectedErrorScreen extends StatelessWidget {
  const UnexpectedErrorScreen({super.key, this.failedMessage});
  final String? failedMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'An unexpected error\noccurred!',
              textAlign: TextAlign.center,
              style: titleStyle.copyWith(
                fontSize: 32,
              ),
            ),
            Image.asset('images/Computer troubleshooting-pana 1.png'),
            Text(
              failedMessage ??
                  'The link you followed probably\nbroken check the URL spelling\nand try again',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: const Color(0xff3E4446),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 0.35 * Constants.screenWidth,
                  ),
                ),
                backgroundColor:
                    WidgetStatePropertyAll(Theme.of(context).primaryColor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              child: Text(
                'Go back',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
