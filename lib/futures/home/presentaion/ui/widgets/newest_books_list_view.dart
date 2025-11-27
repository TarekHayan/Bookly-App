import 'package:bookly_app/core/widgets/shimmir_loading_virt.dart';
import 'package:bookly_app/futures/home/presentaion/logic/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly_app/futures/home/presentaion/ui/widgets/newsest_books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: NewestBooksView(bookModel: state.books[index]),
              );
            }, childCount: state.books.length),
          );
        } else if (state is FetchNewestBooksFauliar) {
          return SliverToBoxAdapter(
            child: Center(child: ErrorWidget(state.errorMsg)),
          );
        } else {
          return const SliverToBoxAdapter(child: ShimmerNewestBooksVirtical());
        }
      },
    );
  }
}
