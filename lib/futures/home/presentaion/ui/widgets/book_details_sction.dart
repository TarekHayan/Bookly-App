import 'package:bookly_app/constens.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/best_seller_view.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/box_action.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Image.asset(
            ktestCoveBook,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const SizedBox(height: 22),
          const Text("The Jungle Book", style: Styles.textStyle30),
          const SizedBox(height: 6),
          Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(color: Colors.white60),
          ),
          const SizedBox(height: 10),

          const Center(child: BookRating()),
          const SizedBox(height: 40),
          const BoxActions(),
        ],
      ),
    );
  }
}
