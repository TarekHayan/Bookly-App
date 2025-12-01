import 'package:bloc/bloc.dart';
import '../../../../home/data/Models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_search_books_state.dart';

class FetchSearchBooksCubit extends Cubit<FetchSearchBooksState> {
  FetchSearchBooksCubit({required this.searchRepo})
    : super(FetchSearchBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String search}) async {
    emit(FetchSearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(search: search);
    result.fold(
      (exiption) {
        emit(FetchSearchBooksFaluiar(errorMsg: exiption.errorMsg));
      },
      (books) {
        emit(FetchSearchBooksSuccess(books: books));
      },
    );
  }
}
