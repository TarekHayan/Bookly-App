import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/erro_text.dart';
import '../../../../../core/widgets/shimmir_loading_horz.dart';
import '../../../data/Models/book_model/book_model.dart';
import '../../logic/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'cover_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBookListView extends StatefulWidget {
  const SimilarBookListView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<SimilarBookListView> createState() => _SimilarBookListViewState();
}

class _SimilarBookListViewState extends State<SimilarBookListView> {
  @override
  void initState() {
    String category;
    if (widget.bookModel.volumeInfo!.categories != null &&
        widget.bookModel.volumeInfo!.categories!.isNotEmpty) {
      category = widget.bookModel.volumeInfo!.categories![0];
    } else {
      category = widget.bookModel.volumeInfo!.title!;
    }

    BlocProvider.of<FetchSimilarBooksCubit>(
      context,
    ).fetchSimilarBooks(category: category);
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
                        child: GestureDetector(
                          onTap: () {
                            context.push(
                              AppRouter.bookDeatailsPage,
                              extra: state.books[index],
                            );
                          },
                          child: CoverBooks(
                            image: state.books[index].volumeInfo!.safeThumbnail,
                          ),
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
