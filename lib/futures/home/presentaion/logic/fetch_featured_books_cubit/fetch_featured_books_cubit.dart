import 'package:bloc/bloc.dart';
import 'package:bookly_app/futures/home/data/Models/book_model/ook_model.dart';
import 'package:bookly_app/futures/home/data/Repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.homeRepo) : super(FetchFeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFuturedBooks() async {
    emit(FetchFeaturedBooksLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold(
      (fauliarError) {
        emit(FetchFeaturedBooksFauliar(errorMsg: fauliarError.errorMsg));
      },
      (books) {
        emit(FetchFeaturedBooksSuccess(books: books));
      },
    );
  }
}
