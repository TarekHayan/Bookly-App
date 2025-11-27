import 'package:bookly_app/futures/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDeatilsPage extends StatelessWidget {
  const BookDeatilsPage({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsBody(bookModel: bookModel)),
    );
  }
}
