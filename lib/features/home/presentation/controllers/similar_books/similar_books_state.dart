part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  const SimilarBooksFailure(this.errorMessage);

  final String errorMessage;
}

class SimilarBooksSuccess extends SimilarBooksState {
  const SimilarBooksSuccess(this.books);

  final List<BookResponseModel> books;
}
