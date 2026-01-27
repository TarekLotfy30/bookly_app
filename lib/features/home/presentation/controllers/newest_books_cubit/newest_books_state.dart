part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksFailure extends NewestBooksState {
  const NewestBooksFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

final class NewestBooksSuccess extends NewestBooksState {
  const NewestBooksSuccess(this.books);

  final List<BookEntity> books;

  @override
  List<Object> get props => [books];
}
