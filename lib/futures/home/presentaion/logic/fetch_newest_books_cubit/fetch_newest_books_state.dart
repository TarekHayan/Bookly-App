part of 'fetch_newest_books_cubit.dart';

sealed class FetchNewestBooksState extends Equatable {
  const FetchNewestBooksState();

  @override
  List<Object> get props => [];
}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksFauliar extends FetchNewestBooksState {
  final String errorMsg;

  const FetchNewestBooksFauliar({required this.errorMsg});
}

final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookModel> books;

  const FetchNewestBooksSuccess({required this.books});
}
