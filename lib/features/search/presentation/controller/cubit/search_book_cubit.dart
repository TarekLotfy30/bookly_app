import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/search_book_repo.dart';
import '../../../domain/entity/search_book_entity.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this._booksRepository) : super(SearchBookInitial());

  final SearchBookRepo _booksRepository;

  Future<void> searchBooks(String query) async {
    emit(SearchBookLoading());
    final result = await _booksRepository.searchBooks(query);
    result.fold(
      (failure) => emit(SearchBookFailure(failure.errMessage)),
      (books) => emit(SearchBookSuccess(books)),
    );
  }
}
