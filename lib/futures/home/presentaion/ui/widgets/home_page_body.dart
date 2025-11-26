import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/newest_books_list_view.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/custom_app_bar.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/list_view_cover_books_items.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBar()),
        // horizintal scroll
        const SliverToBoxAdapter(child: ListViewCoverBooksItems()),

        const SliverToBoxAdapter(child: SizedBox(height: 25)),
        // Title
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Text(
              "Newest Books",
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),

        const SliverFillRemaining(child: NewestBooksListView()),
      ],
    );
  }
}
