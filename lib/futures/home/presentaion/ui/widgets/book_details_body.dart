import 'package:bookly_app/futures/home/presentaion/ui/widgets/book_details_sction.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              CustomBooKDetailsAppBar(),
              BookDetailsSection(),
              Expanded(child: SizedBox(height: 50)),
              SimilarBookListView(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
