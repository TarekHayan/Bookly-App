import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/erro_text.dart';
import 'package:bookly_app/core/widgets/shimmir_loading_horz.dart';
import 'package:bookly_app/futures/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/futures/home/presentaion/logic/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/cover_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListView extends StatefulWidget {
  const SimilarBookListView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<SimilarBookListView> createState() => _SimilarBookListViewState();
}

class _SimilarBookListViewState extends State<SimilarBookListView> {
  @override
  void initState() {
    BlocProvider.of<FetchSimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookModel.volumeInfo?.categories?[0] ?? "Programming",
    );
    super.initState();
  }

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
          BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
            builder: (context, state) {
              if (state is FetchSimilarBooksSuccess) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView.builder(
                    itemCount: state.books.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.5),
                        child: CoverBooks(
                          image: state.books[index].volumeInfo!.safeThumbnail,
                        ),
                      );
                    },
                  ),
                );
              } else if (state is FetchSimilarBooksfauliar) {
                return ErrorTextWidget(state.errorMsg);
              } else {
                return const ShimmerFeaturedBooksHorizontal();
              }
            },
          ),
        ],
      ),
    );
  }
}
