part of 'fetch_featured_books_cubit.dart';

sealed class FetchFeaturedBooksState extends Equatable {
  const FetchFeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksFauliar extends FetchFeaturedBooksState {
  final String errorMsg;

  const FetchFeaturedBooksFauliar({required this.errorMsg});
}

final class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookModel> books;

  const FetchFeaturedBooksSuccess({required this.books});
}
