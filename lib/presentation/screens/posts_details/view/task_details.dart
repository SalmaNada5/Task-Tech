import 'package:task_tech/utils/exports.dart';
import 'package:task_tech/presentation/screens/posts/view/comment.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/comments_controller.dart';
import 'package:task_tech/presentation/screens/posts_details/controller/task_details_controller.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({
    super.key,
    required this.postId,
  });
  final String postId;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    PostDetailsCubit postDetailsCubit =
        BlocProvider.of<PostDetailsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(TaskController
                            .taskDetailsModel.data?.post.user?.photo ??
                        ""),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    TaskController.taskDetailsModel.data?.post.user?.name ?? "",
                    style: labelTextFormStyle,
                  ),
                  const Spacer(),
                  Text(
                    '${Constants.convertToTimeAgo(TaskController.taskDetailsModel.data?.post.createdAt)} ago',
                    style: labelTextFormStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      TaskController.taskDetailsModel.data?.post.name ?? "",
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      style: postNameStyle,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${TaskController.taskDetailsModel.data?.post.salary}',
                    style: postNameStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                TaskController.taskDetailsModel.data?.post.description ?? "",
                softWrap: true,
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                style: postDescriptionStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Delivery Time',
                style: headStyle.copyWith(
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
              ),
              Text(
                '${TaskController.taskDetailsModel.data?.post.delieveryDate} Days',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7C7C7C),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Comments',
                style: headStyle.copyWith(
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(224, 224, 224, 0.9),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListView.separated(
                  itemCount: CommentsController.comments.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Color(0xffE0E0E0),
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    return ReusableCommentWidget(
                      userName: CommentsController.comments[i].user?.name ?? '',
                      rate:
                          CommentsController.comments[i].user?.ratingsAverage ??
                              0,
                      date: Constants.convertToTimeAgo(
                              CommentsController.comments[i].createdAt)
                          .toString(),
                      imgUrl: CommentsController.comments[i].user?.photo ?? '',
                      text: CommentsController.comments[i].text ?? '',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(8.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 18,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: CurrentUserInfoController
                          .userInfoModel.data?.user.photo ??
                      '',
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Image.asset(
                    'images/default person.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextFormField(
                minLines: 1,
                maxLines: 5,
                controller: postDetailsCubit.commentController,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
                decoration: InputDecoration(
                  hintText: 'Add your comment',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xff7C7C7C),
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  filled: true,
                  fillColor:
                      isDarkMode ? const Color(0xff213440) : Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(224, 224, 224, 0.9),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(224, 224, 224, 0.9),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  postDetailsCubit.onCommentTextFieldValueChanged(value);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            BlocBuilder<PostDetailsCubit, PostDetailsState>(
              builder: (context, state) {
                return postDetailsCubit.showIcon
                    ? GestureDetector(
                        onTap: () async {
                          await postDetailsCubit.addCommentFunction(postId);
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
