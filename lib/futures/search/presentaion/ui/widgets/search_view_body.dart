import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/erro_text.dart';
import '../../../../../core/widgets/no_result_search.dart';
import '../../../../../core/widgets/shimmir_loading_virt.dart';
import '../../logic/fetch_search_books_cubit/fetch_search_books_cubit.dart';
import 'custom_text_field.dart';
import 'result%20_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 28),
      child: Column(
        children: [
          CustoumTextField(),
          SizedBox(height: 80),
          Expanded(child: ResultBookView()),
        ],
      ),
    );
  }
}

class ResultBookView extends StatelessWidget {
  const ResultBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BlocBuilder<FetchSearchBooksCubit, FetchSearchBooksState>(
        builder: (context, state) {
          if (state is FetchSearchBooksInitial) {
            return const NoResultSearch();
          }
          if (state is FetchSearchBooksSuccess) {
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        AppRouter.bookDeatailsPage,
                        extra: state.books[index],
                      );
                    },
                    child: ResultView(bookModel: state.books[index]),
                  ),
                );
              },
            );
          } else if (state is FetchSearchBooksFaluiar) {
            return ErrorTextWidget(state.errorMsg);
          } else {
            return const ShimmerNewestBooksVirtical();
          }
        },
      ),
    );
  }
}
