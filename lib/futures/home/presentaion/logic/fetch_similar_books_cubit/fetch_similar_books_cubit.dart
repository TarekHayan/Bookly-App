import 'package:bloc/bloc.dart';
import 'package:bookly_app/futures/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/futures/home/data/Repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.homeRepo) : super(FetchSimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    if (isClosed) return;
    emit(FetchSimilarBooksLoading());

    var result = await homeRepo.fetchSimilarBooks(category: category);

    if (isClosed) return;

    result.fold(
      (fauliarError) {
        if (isClosed) return;
        emit(FetchSimilarBooksfauliar(errorMsg: fauliarError.errorMsg));
      },
      (books) {
        if (isClosed) return;
        emit(FetchSimilarBooksSuccess(books: books));
      },
    );
  }
}
