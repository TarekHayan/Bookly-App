import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/futures/home/ui/widgets/custom_app_bar.dart';
import 'package:bookly_app/futures/home/ui/widgets/list_view_cover_books_items.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListViewCoverBooksItems(),
        ),
        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("Best Seller", style: Styles.titleMeduim),
        ),
      ],
    );
  }
}
