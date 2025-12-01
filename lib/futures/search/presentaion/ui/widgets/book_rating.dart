import '../../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatingView extends StatelessWidget {
  const BookRatingView({
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
          size: 12,
        ),
        const SizedBox(width: 6),
        Text(rating, style: Styles.textStyle14),
        const SizedBox(width: 6),
        Text(
          "($ratingCount)",
          style: Styles.textStyle14.copyWith(color: Colors.white60),
        ),
      ],
    );
  }
}
