import 'package:task_tech/utils/exports.dart';
import 'package:task_tech/presentation/screens/posts/view/reusable_post_widget.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostsCubit postsCubit = BlocProvider.of<PostsCubit>(context);
    postsCubit.getAllPosts();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
      child: BlocBuilder<PostsCubit, PostsState>(
        bloc: postsCubit,
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    'Posts',
                    style: titleStyle.copyWith(
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color),
                  ),
                  const Spacer(),
                  Text(
                    'Sort by ',
                    style: headStyle.copyWith(
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                    ),
                  ),
                  DropdownButton<String>(
                    value: postsCubit.dropDownItem,
                    elevation: 0,
                    underline: const SizedBox(),
                    style: headStyle.copyWith(
                        color: Theme.of(context).primaryColor),
                    dropdownColor: Colors.white,
                    iconSize: 30,
                    iconEnabledColor: Theme.of(context).primaryColor,
                    items: postsCubit.dropdownItemsList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (selectedVal) {
                      postsCubit.onDropDownItemSelected(selectedVal ?? '');
                    },
                  ),
                ],
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: postsCubit.onRefresh,
                  child: postsCubit.dropDownItem == 'Tasks'
                      ? SingleChildScrollView(
                          controller: postsCubit.tasksScrollController,
                          child: Column(
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) => ReusablePostWidget(
                                  taskId: PostController.tasks[i].id,
                                  dropDownVal: postsCubit.dropDownItem,
                                  profileImgUrl:
                                      PostController.tasks[i].user?.photo ?? '',
                                  accountName:
                                      PostController.tasks[i].user?.name ?? '',
                                  postDescription:
                                      PostController.tasks[i].description ?? '',
                                  postTime: Constants.convertToTimeAgo(
                                      PostController.tasks[i].createdAt),
                                ),
                                itemCount: PostController.tasks.length,
                              ),
                              // ...List.generate(
                              //   PostController.tasks.length,
                              //   (i) => ReusablePostWidget(
                              //     taskId: PostController.tasks[i].id,
                              //     dropDownVal: postsCubit.dropDownItem,
                              //     profileImgUrl:
                              //         PostController.tasks[i].user?.photo ?? '',
                              //     accountName:
                              //         PostController.tasks[i].user?.name ?? '',
                              //     postDescription:
                              //         PostController.tasks[i].description ?? '',
                              //     postTime: Constants.convertToTimeAgo(
                              //         PostController.tasks[i].createdAt),
                              //   ),
                              // ),
                              postsCubit.taskPostsLoading
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: CircularProgressIndicator(),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ))
                      : SingleChildScrollView(
                          controller: postsCubit.servicesScollController,
                          child: Column(
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) => ReusablePostWidget(
                                  serviceId: PostController.services[i].id,
                                  dropDownVal: postsCubit.dropDownItem,
                                  profileImgUrl:
                                      PostController.services[i].user?.photo ??
                                          '',
                                  accountName:
                                      PostController.services[i].user?.name ??
                                          '',
                                  postDescription:
                                      PostController.services[i].description ??
                                          '',
                                  postTime: Constants.convertToTimeAgo(
                                      PostController.services[i].createdAt),
                                ),
                                itemCount: PostController.services.length,
                              ),
                              // ...List.generate(
                              //   PostController.services.length,
                              //   (i) => ReusablePostWidget(
                              //     serviceId: PostController.services[i].id,
                              //     dropDownVal: postsCubit.dropDownItem,
                              //     profileImgUrl:
                              //         PostController.services[i].user?.photo ??
                              //             '',
                              //     accountName:
                              //         PostController.services[i].user?.name ??
                              //             '',
                              //     postDescription:
                              //         PostController.services[i].description ??
                              //             '',
                              //     postTime: Constants.convertToTimeAgo(
                              //         PostController.services[i].createdAt),
                              //   ),
                              // ),
                              postsCubit.servicePageLoading
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: CircularProgressIndicator(),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
