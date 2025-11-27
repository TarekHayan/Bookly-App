import 'package:bloc/bloc.dart';
import 'package:bookly_app/futures/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/futures/home/data/Repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.homeRepo) : super(FetchSimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(FetchSimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (fauliarError) {
        emit(FetchSimilarBooksfauliar(errorMsg: fauliarError.errorMsg));
      },
      (books) {
        emit(FetchSimilarBooksSuccess(books: books));
      },
    );
  }
}
