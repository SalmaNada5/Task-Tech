import 'package:task_tech/utils/exports.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key, required this.isMe}) : super(key: key);
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            isMe
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 54,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(22, 80, 105, 0.21),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: MaterialButton(
                        onPressed: () async =>
                            await UploadCVController.attachCV(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_outlined,
                              color: Theme.of(context).primaryColor,
                              weight: 500,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Upload CV',
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    image: const AssetImage(
                      'images/image 18.png',
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3),
                const Spacer(),
                Image(
                    image: const AssetImage('images/image 13.png'),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3),
                const Spacer(),
                Image(
                    image: const AssetImage('images/image 14.png'),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3),
              ],
            ),
            const SizedBox(
              height: 19.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    image: const AssetImage('images/image 15.png'),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3),
                const Spacer(),
                Image(
                    image: const AssetImage('images/image 16.png'),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3),
                const Spacer(),
                Image(
                    image: const AssetImage('images/image 17.png'),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
