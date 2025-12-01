import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/book_model/book_model.dart';
import '../../../data/Repos/home_repo.dart';

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
