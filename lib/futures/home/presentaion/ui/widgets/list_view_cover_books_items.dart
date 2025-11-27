import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/erro_text.dart';
import 'package:bookly_app/core/widgets/shimmir_loading_horz.dart';
import 'package:bookly_app/futures/home/presentaion/logic/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/cover_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListViewCoverBooksItems extends StatelessWidget {
  const ListViewCoverBooksItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.5),
                  child: GestureDetector(
                    onTap: () => context.push(
                      AppRouter.bookDeatailsPage,
                      extra: state.books[index],
                    ),
                    child: CoverBooks(
                      image: state.books[index].volumeInfo!.safeThumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FetchFeaturedBooksFauliar) {
          return ErrorTextWidget(state.errorMsg);
        } else {
          return const ShimmerFeaturedBooksHorizontal();
        }
      },
    );
  }
}
