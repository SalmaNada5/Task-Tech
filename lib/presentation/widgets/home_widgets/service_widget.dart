import 'package:task_tech/utils/exports.dart';

class RelatedPostItem extends StatefulWidget {
  const RelatedPostItem({
    super.key,
    required this.serviceImgUrl,
    required this.profileImgUrl,
    required this.userName,
    required this.description,
    required this.salary,
    required this.rate,
    this.onpressed,
  });
  final String serviceImgUrl;
  final String profileImgUrl;
  final String userName;
  final String description;
  final int salary;
  final num rate;
  final void Function()? onpressed;
  @override
  State<RelatedPostItem> createState() => _RelatedPostItemState();
}

bool isFavorite = false;

class _RelatedPostItemState extends State<RelatedPostItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.5 * Constants.screenWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).scaffoldBackgroundColor),
          elevation: const WidgetStatePropertyAll(4),
          shadowColor: const WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: widget.onpressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: widget.serviceImgUrl,
                height: 80,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: widget.profileImgUrl,
                      errorWidget: (context, url, error) =>
                          Image.asset('images/person.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.userName,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.headlineSmall!.color,
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
                widget.description,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 0.9,
              width: 0.4 * Constants.screenWidth,
              color: const Color(0xffB1B1B1),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Starting at ',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff7C7C7C),
                  ),
                ),
                Text(
                  '\$${widget.salary}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.headlineSmall!.color,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${widget.rate}',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
