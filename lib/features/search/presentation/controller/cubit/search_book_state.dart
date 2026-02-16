part of 'search_book_cubit.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

final class SearchBookInitial extends SearchBookState {}

final class SearchBookLoading extends SearchBookState {}

final class SearchBookSuccess extends SearchBookState {
  const SearchBookSuccess(this.books);
  final List<SearchBookEntity> books;
}

final class SearchBookFailure extends SearchBookState {
  final String errorMessage;
  const SearchBookFailure(this.errorMessage);
}
