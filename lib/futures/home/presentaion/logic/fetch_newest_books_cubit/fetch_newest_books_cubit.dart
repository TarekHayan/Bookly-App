import 'package:bloc/bloc.dart';
import 'package:bookly_app/futures/home/data/Models/book_model/ook_model.dart';
import 'package:bookly_app/futures/home/data/Repos/home_page_repo_impel.dart';
import 'package:equatable/equatable.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.homePageRepoImpel)
    : super(FetchNewestBooksInitial());
  final HomePageRepoImpel homePageRepoImpel;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var restult = await homePageRepoImpel.fetchNewestBooks();
    restult.fold(
      (fauliar) {
        emit(FetchNewestBooksFauliar(errorMsg: fauliar.errorMsg));
      },
      (books) {
        emit(FetchNewestBooksSuccess(books: books));
      },
    );
  }
}
