import 'package:task_tech/utils/exports.dart';
class ReviewPage extends StatelessWidget {
  final bool isMe;
  const ReviewPage({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      buildWhen: (p, c) => c is GetUserInfoSucces || c is GetSpecificUserSucces,
      builder: (context, state) {
        return ListView.builder(
          itemCount: isMe
              ? state.userInfoModel?.data?.user.reviews!.length ?? 0
              : homeCubit.userModel.data?.user.reviews?.length ?? 0,
          itemBuilder: (context, i) => ReviewCard(
              name: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].reviewer!
                          .name ??
                      ''
                  : homeCubit
                          .userModel.data?.user.reviews?[i]?.reviewer!.name ??
                      '',
              review: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].review ?? ''
                  : homeCubit.userModel.data?.user.reviews?[i]?.review ?? '',
              rate: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].rating ?? 0.0
                  : homeCubit.userModel.data?.user.reviews?[i]?.rating ?? 0.0,
              imgUrl: isMe
                  ? state.userInfoModel?.data?.user.reviews![i].reviewer!
                          .photo ??
                      ''
                  : homeCubit
                          .userModel.data?.user.reviews?[i]?.reviewer!.photo ??
                      '',
              textColor: Theme.of(context).textTheme.headlineSmall!.color!),
        );
      },
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {super.key,
      required this. name,
      required this. review,
      required this. rate,
      required this. imgUrl,
      required this. textColor});
  final String name;
  final String review;
  final num rate;
  final String imgUrl;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: CircleAvatar(
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          errorWidget: (context, url, error) {
            return Image.asset(
              'images/placeholder.jpg',
            );
          },
        ),
      ),
      //radius: 37.5,
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Color.fromRGBO(255, 193, 7, 1),
          size: 25,
        ),
        Text(
          '$rate',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(255, 193, 7, 1),
          ),
        )
      ],
    ),
    title: Padding(
      padding: const EdgeInsetsDirectional.only(top: 20.0),
      child: Text(
        name,
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
      ),
    ),
    isThreeLine: true,
    subtitle: Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.0),
      child: Text(
        review,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
      ),
    ),
  );
  }
}
