import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/constants/colors.dart';
import 'package:task_tech/constants/text_styles.dart';
import 'package:task_tech/presentation/screens/posts/view/comment.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.deliveryTime});
  final String name;
  final String description;
  final String price;
  final String deliveryTime;

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

TextEditingController _commentController = TextEditingController();

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  bool showIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              backgroundColor: MaterialStateProperty.all(primaryLightColor),
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
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Aya Mohamed',
                    style: labelTextFormStyle,
                  ),
                  const Spacer(),
                  Text(
                    '1 Hr ago',
                    style: labelTextFormStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      widget.name,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      style: postNameStyle,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${widget.price}',
                    style: postNameStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.description,
                softWrap: true,
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                style: postDescriptionStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Dlivery Time',
                style: headStyle,
              ),
              Text(
                widget.deliveryTime,
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
                style: headStyle,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(224, 224, 224, 0.9),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Color(0xffE0E0E0),
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      const ReusableCommentWidget(
                    userName: 'Eman Elsayed',
                    rate: 3,
                    date: 'june 15, 11:30 AM',
                    imgUrl:
                        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    text: 'I will design a beautiful website for your business',
                  ),
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const CircleAvatar(
              //       backgroundImage: NetworkImage(
              //         'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              //       ),
              //       radius: 20,
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.8,
              //       child: TextFormField(
              //         minLines: 2,
              //         maxLines: 5,
              //         controller: _commentController,
              //         decoration: InputDecoration(
              //           hintText: 'Add your comment',
              //           hintStyle: GoogleFonts.poppins(
              //             fontSize: 12,
              //             color: const Color(0xff7C7C7C),
              //           ),
              //           filled: true,
              //           fillColor: Colors.white,
              //           contentPadding: const EdgeInsets.all(10),
              //           enabledBorder: const OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xff37474F)),
              //           ),
              //           focusedBorder: const OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xff37474F)),
              //           ),
              //         ),
              //         onChanged: (value) {
              //           _commentController.text = value.toString();
              //           _commentController.selection = TextSelection.collapsed(
              //               offset: _commentController.text.length);
              //         },
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
              radius: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextFormField(
                minLines: 1,
                maxLines: 5,
                controller: _commentController,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Add your comment',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xff7C7C7C),
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  filled: true,
                  fillColor: Colors.white,
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
                  // suffixIcon: showIcon
                  //     ? IconButton(
                  //         onPressed: () {},
                  //         icon: Icon(
                  //           Icons.keyboard_arrow_right,
                  //           color: primaryLightColor,
                  //           size: 30,
                  //         ),
                  //       )
                  //     : null,
                ),
                onChanged: (value) {
                  _commentController.text = value.toString();
                  _commentController.selection = TextSelection.collapsed(
                      offset: _commentController.text.length);

                  setState(() {
                    value.isNotEmpty ? showIcon = true : showIcon = false;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            showIcon
                ? Text(
                    'Post',
                    style: TextStyle(
                      color: primaryLightColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
