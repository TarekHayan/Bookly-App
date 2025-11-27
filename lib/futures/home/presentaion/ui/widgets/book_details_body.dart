import 'package:bookly_app/futures/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/book_details_sction.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomBooKDetailsAppBar(),
              const SizedBox(height: 20),
              BookDetailsSection(bookModel: bookModel),
              const Expanded(child: SizedBox(height: 30)),
              SimilarBookListView(bookModel: bookModel),
            ],
          ),
        ),
      ],
    );
  }
}
