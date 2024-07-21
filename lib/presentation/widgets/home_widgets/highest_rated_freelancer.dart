import 'package:task_tech/utils/exports.dart';

class HighestRatedFreelancer extends StatelessWidget {
  const HighestRatedFreelancer(
      {super.key,
      required this.userImgUrl,
      required this.userName,
      required this.job,
      required this.rate,
      required this.onPress});
  final String userImgUrl;
  final String userName;
  final String job;
  final num rate;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.3 * Constants.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: ClipOval(
              child: CachedNetworkImage(
                  imageUrl: userImgUrl,
                  errorWidget: (context, url, error) {
                    return Image.asset('images/person.png');
                  }),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            userName,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.headlineSmall!.color,
            ),
          ),
          Text(
            job,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: const Color(0xffB1B1B1),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 12,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$rate',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? const Color(0xffCEDADF)
                      : const Color(0xff213440)),
              shadowColor: const WidgetStatePropertyAll(
                Color.fromRGBO(22, 80, 105, 0.5),
              ),
              elevation: const WidgetStatePropertyAll(10),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            onPressed: onPress,
            child: Text(
              'View profile',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? const Color(0xff165069)
                          : Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
