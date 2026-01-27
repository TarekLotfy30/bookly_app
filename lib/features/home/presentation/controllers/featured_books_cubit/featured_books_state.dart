part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailure extends FeaturedBooksState {
  const FeaturedBooksFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  const FeaturedBooksSuccess(this.books);

  final List<BookEntity> books;

  @override
  List<Object> get props => [books];
}
