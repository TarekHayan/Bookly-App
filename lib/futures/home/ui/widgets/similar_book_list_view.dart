import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/futures/home/ui/widgets/cover_books.dart';
import 'package:flutter/material.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You can also like",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5),
                  child: CoverBooks(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
