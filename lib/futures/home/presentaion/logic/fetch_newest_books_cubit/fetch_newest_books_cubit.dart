import 'package:bloc/bloc.dart';
import '../../../data/Models/book_model/book_model.dart';
import '../../../data/Repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.homeRepo) : super(FetchNewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var restult = await homeRepo.fetchNewestBooks();
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
