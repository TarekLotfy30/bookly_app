part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  const SimilarBooksFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

final class SimilarBooksSuccess extends SimilarBooksState {
  const SimilarBooksSuccess(this.books);

  final List<BookEntity> books;

  @override
  List<Object> get props => [books];
}
