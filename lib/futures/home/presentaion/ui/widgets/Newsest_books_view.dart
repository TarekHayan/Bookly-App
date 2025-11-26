import 'package:bookly_app/constens.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/futures/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/cover_books.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NewestBooksView extends StatelessWidget {
  const NewestBooksView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.bookDeatailsPage),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CoverBooks(image: bookModel.volumeInfo!.safeThumbnail),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    bookModel.volumeInfo!.title!,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kgTSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  bookModel.volumeInfo!.authors![0],
                  style: Styles.textStyle14.copyWith(
                    color: Colors.white.withOpacity(.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      "Free",
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 37),
                    BookRating(
                      rating: bookModel.volumeInfo!.checkRating.toString(),
                      ratingCount: "(${bookModel.volumeInfo!.checkRatingCount})"
                          .toString(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.rating,
    required this.ratingCount,
  });
  final String rating;
  final String ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 15,
        ),
        const SizedBox(width: 6),
        Text(rating, style: Styles.textStyle16),
        const SizedBox(width: 6),
        Text(
          ratingCount,
          style: Styles.textStyle14.copyWith(color: Colors.white60),
        ),
      ],
    );
  }
}
