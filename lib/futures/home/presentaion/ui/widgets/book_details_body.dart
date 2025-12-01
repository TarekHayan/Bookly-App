import '../../../data/Models/book_model/book_model.dart';
import '../../../../../core/widgets/book_details_sction.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_book_list_view.dart';
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
