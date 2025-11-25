import 'package:bookly_app/core/widgets/erro_text.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/futures/home/presentaion/logic/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/cover_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  child: CoverBooks(
                    image: state.books[index].volumeInfo!.safeThumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is FetchFeaturedBooksFauliar) {
          return ErrorTextWidget(state.errorMsg);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
