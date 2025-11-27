import 'package:bookly_app/core/widgets/erro_text.dart';
import 'package:bookly_app/core/widgets/shimmir_loading_virt.dart';
import 'package:bookly_app/futures/home/presentaion/logic/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/Newsest_books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestBooksView(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is FetchNewestBooksFauliar) {
          return ErrorTextWidget(state.errorMsg);
        } else {
          return const ShimmerNewestBooks();
        }
      },
    );
  }
}
