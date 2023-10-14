import 'package:task_tech/utils/exports.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 15, end: 15, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: Image.asset('images/search.png'),
                    suffixIcon: Image.asset('images/filter.png'),
                    hintText: 'Search message..',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffC0C0C0),
                    ),
                    fillColor: Theme.of(context).canvasColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffB8B8B8)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffB8B8B8)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                  onChanged: (value) {
                    _searchController.text = value.toString();
                    _searchController.selection = TextSelection.collapsed(
                        offset: _searchController.text.length);
                  },
                ),
              ),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: chatsList.length,
                  itemBuilder: (context, index) {
                    return ConversationList(
                      name: chatsList[index].name,
                      messageText: chatsList[index].messageText,
                      imageURL: chatsList[index].image,
                      time: chatsList[index].time,
                      isRead: chatsList[index].isRead,
                      unreadCount: chatsList[index].unreadCount,
                      isReceiveMess: chatsList[index].isReceiveMess,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
