import 'package:bookly_app/constens.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/futures/home/ui/widgets/best_seller_view.dart';
import 'package:bookly_app/futures/home/ui/widgets/custom_app_bar.dart';
import 'package:bookly_app/futures/home/ui/widgets/list_view_cover_books_items.dart';
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
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Text("Best Seller", style: Styles.textStyle18),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const BestSellerView(),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
