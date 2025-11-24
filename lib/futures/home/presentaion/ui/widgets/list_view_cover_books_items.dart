import 'package:bookly_app/futures/home/presentaion/ui/widgets/cover_books.dart';
import 'package:flutter/material.dart';

class ListViewCoverBooksItems extends StatelessWidget {
  const ListViewCoverBooksItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.5),
            child: CoverBooks(),
          );
        },
      ),
    );
  }
}
