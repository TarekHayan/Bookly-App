part of 'fetch_search_books_cubit.dart';

sealed class FetchSearchBooksState extends Equatable {
  const FetchSearchBooksState();

  @override
  List<Object> get props => [];
}

final class FetchSearchBooksInitial extends FetchSearchBooksState {}

final class FetchSearchBooksLoading extends FetchSearchBooksState {}

final class FetchSearchBooksSuccess extends FetchSearchBooksState {
  final List<BookModel> books;

  const FetchSearchBooksSuccess({required this.books});
}

final class FetchSearchBooksFaluiar extends FetchSearchBooksState {
  final String errorMsg;

  const FetchSearchBooksFaluiar({required this.errorMsg});
}
