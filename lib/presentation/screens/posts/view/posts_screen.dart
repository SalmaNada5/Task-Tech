import 'package:flutter/material.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/posts/controller/post_controller.dart';
import 'package:task_tech/presentation/screens/posts/view/reusable_post_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<String> list = ['Tasks', 'Services'];
  String _dropdownValue = 'Tasks';
  @override
  void initState() {
    taskPageScrollController();
    servicePageScrollController();
    getAllTasks();
    getAllServices();
    super.initState();
  }

  void getAllTasks() async {
    try {
      await PostController.getTaskPosts();
      setState(() {});
    } catch (e) {
      logError('$e in getAllTasks');
    }
  }

  void getAllServices() async {
    try {
      await PostController.getServicePosts();
      setState(() {});
    } catch (e) {
      logError('$e in getAllServices');
    }
  }

  bool isLoading = false;
  void taskPageScrollController() async {
    PostController.scrollController.addListener(() async {
      if (PostController.scrollController.position.atEdge &&
          PostController.scrollController.position.pixels != 0) {
        if (PostController.taskPage >
            (PostController.postModel.paginationResult?.numberOfPages ?? 1)) {
          return;
        }
        if (isLoading) {
          return;
        }
        setState(() {
          isLoading = true;
        });
        await PostController.getTaskPosts(dioLoading: false);
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  bool servicePageLoading = false;
  void servicePageScrollController() async {
    PostController.scrollController.addListener(() async {
      if (PostController.scrollController.position.atEdge &&
          PostController.scrollController.position.pixels != 0) {
        if (PostController.servicePage >
            (PostController.serviceModel.paginationResult?.numberOfPages ??
                1)) {
          return;
        }
        if (servicePageLoading) {
          return;
        }
        setState(() {
          servicePageLoading = true;
        });
        await PostController.getServicePosts(dioLoading: false);
        setState(() {
          servicePageLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Posts',
                  style: titleStyle,
                ),
                const Spacer(),
                Text(
                  'Sort by ',
                  style: headStyle.copyWith(
                    fontWeight: FontWeight.w100,
                  ),
                ),
                DropdownButton<String>(
                  value: _dropdownValue,
                  elevation: 0,
                  underline: const SizedBox(),
                  style: headStyle,
                  dropdownColor: Colors.white,
                  iconSize: 30,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.black,
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (selectedVal) {
                    setState(() {
                      _dropdownValue = selectedVal.toString();
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: PostController.scrollController,
                scrollDirection: Axis.vertical,
                child: _dropdownValue == 'Tasks'
                    ? Column(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, i) => ReusablePostWidget(
                              taskId:
                                  PostController.postModel.data!.posts[i].id,
                              // serviceId: PostController
                              //     .serviceModel.data!.services[i].id,
                              dropDownVal: _dropdownValue,
                              profileImgUrl:
                                  PostController.tasks[i].user?.photo ?? '',
                              accountName:
                                  PostController.tasks[i].user?.name ?? '',
                              postDescription:
                                  PostController.tasks[i].description,
                              postTime: Constants.convertToTimeAgo(
                                  PostController
                                      .postModel.data!.posts[i].createdAt),
                              // _dropdownValue == 'Tasks'
                              //     ? PostController.postModel.data!.posts[i].createdAt
                              //     : PostController
                              //         .serviceModel.data!.services[i].createdAt,
                            ),
                            itemCount: PostController.tasks.length,
                          ),
                          isLoading
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: CircularProgressIndicator(),
                                )
                              : const SizedBox.shrink(),
                        ],
                      )
                    : Column(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, i) => ReusablePostWidget(
                              //taskId: PostController.postModel.data!.posts[i].id,
                              serviceId: PostController
                                  .serviceModel.data!.services[i].id,
                              dropDownVal: _dropdownValue,
                              profileImgUrl:
                                  PostController.services[i].user?.photo ?? '',
                              accountName:
                                  PostController.services[i].user?.name ?? '',
                              postDescription:
                                  PostController.services[i].description,
                              postTime: Constants.convertToTimeAgo(
                                  PostController.serviceModel.data!.services[i]
                                      .createdAt),
                              //   DateTime.now(),
                              // _dropdownValue == 'Tasks'
                              //     ? PostController.postModel.data!.posts[i].createdAt
                              //     : PostController
                              //         .serviceModel.data!.services[i].createdAt,
                            ),
                            itemCount: PostController.services.length,
                          ),
                          isLoading
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: CircularProgressIndicator(),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
              ),
            ),
          ],
        ),
      );
  }
}
