import '../utils/styles.dart';
import '../../futures/home/data/Models/book_model/book_model.dart';
import '../../futures/home/presentaion/ui/widgets/newsest_books_view.dart';
import 'box_action.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(
              bookModel.volumeInfo!.safeThumbnail,
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            bookModel.volumeInfo!.title!,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            bookModel.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(color: Colors.white60),
          ),
          const SizedBox(height: 10),

          Center(
            child: BookRating(
              rating: bookModel.volumeInfo!.checkRating.toString(),
              ratingCount:
                  "(${bookModel.volumeInfo!.checkRatingCount.toString()})",
            ),
          ),
          const SizedBox(height: 20),
          BoxActions(bookModel: bookModel),
        ],
      ),
    );
  }
}
