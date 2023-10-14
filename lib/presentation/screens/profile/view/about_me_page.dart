import 'package:task_tech/utils/exports.dart';
class AboutmePage extends StatelessWidget {
  final bool isMe;
  const AboutmePage({
    required this.isMe,
    Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color textColor =
        Theme.of(context).textTheme.headlineSmall!.color ?? Colors.grey;
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: homeCubit,
              buildWhen: (p, c) =>
                  c is GetSpecificUserSucces || c is GetUserInfoSucces,
              builder: (context, state) {
                return Text(
                  maxLines: 5,
                  isMe
                      ? state.userInfoModel?.data?.user.about ?? ''
                      : homeCubit.userModel.data?.user.about ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(124, 124, 124, 1)),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Education',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: textColor),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: const Color.fromRGBO(175, 176, 182, 1)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: homeCubit,
              buildWhen: (p, c) =>
                  c is GetSpecificUserSucces || c is GetUserInfoSucces,
              builder: (context, state) {
                return Text(
                  isMe
                      ? state.userInfoModel?.data?.user.education ?? ''
                      : homeCubit.userModel.data?.user.education ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color.fromRGBO(124, 124, 124, 1)),
                );
              },
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              'Salary',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 16, color: textColor),
            ),
            const SizedBox(
              height: 60,
            ),
            SfRangeSliderTheme(
              data: SfRangeSliderThemeData(
                tooltipBackgroundColor: Colors.white,
                overlayRadius: 10,
                tooltipTextStyle: const TextStyle(
                  color: Color(0xffB1B1B1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: homeCubit,
                builder: (context, state) {
                  return SfRangeSlider(
                    inactiveColor: const Color.fromRGBO(217, 217, 217, 1),
                    activeColor: Theme.of(context).primaryColor,
                    min: 10,
                    max: 1000,
                    enableTooltip: true,
                    shouldAlwaysShowTooltip: true,
                    values: SfRangeValues(
                      isMe
                          ? state.userInfoModel?.data?.user.minimum ?? 100
                          : homeCubit.userModel.data?.user.minimum ?? 100,
                      isMe
                          ? state.userInfoModel?.data?.user.maximum ?? 500
                          : homeCubit.userModel.data?.user.maximum ?? 500,
                    ),
                    minorTicksPerInterval: 10,
                    startThumbIcon: Image.asset('images/thumbIcon.png'),
                    endThumbIcon: Image.asset('images/thumbIcon.png'),
                    onChanged: (sFRange) {},
                    stepSize: 10,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Skills',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 16, color: textColor),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: homeCubit,
                buildWhen: (p, c) =>
                    c is GetSpecificUserSucces || c is GetUserInfoSucces,
                builder: (context, state) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: isMe
                        ? state.userInfoModel?.data?.user.skills!.length ?? 0
                        : homeCubit.userModel.data?.user.skills?.length ?? 0,
                    itemBuilder: (context, i) => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isMe
                            ? state.userInfoModel?.data?.user.skills![i] ?? ''
                            : homeCubit.userModel.data?.user.skills?[i] ?? '',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
