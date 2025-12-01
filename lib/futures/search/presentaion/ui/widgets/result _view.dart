import '../../../../../constens.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/data/Models/book_model/book_model.dart';
import 'book_rating.dart';
import 'book_view.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: SizedBox(
        height: 130,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. صورة الكتاب:
            BookView(image: bookModel.volumeInfo!.safeThumbnail),

            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // العنوان
                  Text(
                    bookModel.volumeInfo!.title!,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kgTSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // المؤلف
                  Text(
                    bookModel.volumeInfo!.authors?[0] ?? "author",
                    style: Styles.textStyle14.copyWith(
                      color: Colors.white.withOpacity(.7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // السعر والتقييم
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      BookRatingView(
                        rating: bookModel.volumeInfo!.checkRating.toString(),
                        ratingCount: bookModel.volumeInfo!.checkRatingCount
                            .toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
