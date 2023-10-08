import 'package:flutter/material.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/add_post/view/post_service.dart';
import 'package:task_tech/presentation/screens/add_post/view/post_task.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Text(
                    'Post a task',
                    style: headStyle.copyWith(
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color),
                  ),
                  Text(
                    'Post a service',
                    style: headStyle.copyWith(
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color),
                  ),
                ],
                indicatorWeight: 7,
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
                labelPadding: const EdgeInsetsDirectional.only(bottom: 10),
                controller: _tabController,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    PostTask(),
                    PostService(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
