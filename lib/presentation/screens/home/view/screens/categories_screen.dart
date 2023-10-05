import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_tech/presentation/screens/home/view/cubit/home_cubit.dart';
import '../../../../../constants/text_styles.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Categories',
          style: titleStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 28,
                  childAspectRatio: 1.3,
                  shrinkWrap: true,
                  children: List.generate(
                    homeCubit.categories.length,
                    (index) => ReusableCategoryItem(
                      url: homeCubit.categories[index].photo,
                      categoryName: homeCubit.categories[index].name,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableCategoryItem extends StatelessWidget {
  const ReusableCategoryItem(
      {super.key, required this.url, required this.categoryName});
  final String url;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(2, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: url,
                errorWidget: (context, url, error) {
                  return Image.asset(
                    'images/placeholder.jpg',
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categoryName,
            style: GoogleFonts.poppins(
              color: Theme.of(context).textTheme.headlineSmall!.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
