import 'package:flutter/material.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/posts/reusable_post_widget.dart';
//import 'package:task_tech/presentation/screens/posts/reusable_post_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

List<String> list = ['Tasks', 'Services'];

class _PostsScreenState extends State<PostsScreen> {
  String _dropdownValue = list.first;
  final String _profileImgUrl =
      'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

  final String _accountName = 'salma nada';
  final String _postTime = '1 Hr ago';
  final String _postDescription = 'sdkhdoguh\nliudifgpu\nddop\n;fhkgip\niot';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, n) => ReusablePostWidget(
                profileImgUrl: _profileImgUrl,
                accountName: _accountName,
                postDescription: _postDescription,
                postTime: _postTime,
              ),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
