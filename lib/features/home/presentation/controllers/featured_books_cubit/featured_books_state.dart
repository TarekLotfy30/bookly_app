part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  const FeaturedBooksFailure(this.errorMessage);

  final String errorMessage;
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  const FeaturedBooksSuccess(this.books);

  final List<BookResponseModel> books;
}
