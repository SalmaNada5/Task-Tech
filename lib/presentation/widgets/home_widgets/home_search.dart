import 'package:task_tech/utils/exports.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: Image.asset('images/search.png'),
        suffixIcon: GestureDetector(
          child: Image.asset('images/filter.png'),
          onTap: () {},
        ),
        hintText: 'what are you looking for?',
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xffC0C0C0),
        ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
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
      onChanged: (value) {
        _searchController.text = value.toString();
        _searchController.selection =
            TextSelection.collapsed(offset: _searchController.text.length);
      },
      readOnly: true,
      onTap: () {
        showSearch(context: context, delegate: HomeSearchDelegate());
      },
    );
  }
}

class HomeSearchDelegate extends SearchDelegate {
  late final Future myFuture = getSearchResult();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: Icon(
          Icons.close,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount:
                  SearchServiceController.searchServiceModel.services?.length ??
                      0,
              itemBuilder: (BuildContext context, int i) => SearchPostResult(
                  onPressed: () => Constants.navigateTo(ServiceDetailsPage(
                        service: SearchServiceController
                            .searchServiceModel.services?[i],
                      )),
                  serviceAttachFile: SearchServiceController
                          .searchServiceModel.services?[i].attachFile ??
                      '',
                  userImg: SearchServiceController
                          .searchServiceModel.services?[i].user?.photo ??
                      '',
                  userName: SearchServiceController
                          .searchServiceModel.services?[i].user?.name ??
                      '',
                  serviceName: SearchServiceController
                          .searchServiceModel.services?[i].name ??
                      ''),
            );
          }
          return const SizedBox.shrink();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  Future<void> getSearchResult() async {
    try {
      await SearchServiceController.searchServiceFunc(query);
    } catch (e) {
      logError('error in getSearchResult: $e');
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.white,
      ),
      textTheme: TextTheme(
          titleLarge: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 16)),
      hintColor: Theme.of(context).textTheme.headlineSmall!.color,
    );
  }
}
