part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  const NewestBooksFailure(this.errorMessage);

  final String errorMessage;
}

class NewestBooksSuccess extends NewestBooksState {
  const NewestBooksSuccess(this.books);

  final List<BookModel> books;
}
