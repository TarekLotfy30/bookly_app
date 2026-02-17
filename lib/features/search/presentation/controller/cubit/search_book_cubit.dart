import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/search_book_repo.dart';
import '../../../domain/entity/search_book_entity.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this._booksRepository) : super(SearchBookInitial());

  final SearchBookRepo _booksRepository;

  String? _currentQuery;

  Future<void> searchBooks(String query) async {
    EasyDebounce.debounce(
      'search-books-debounce',
      const Duration(milliseconds: 400),
      () async {
        final trimmedQuery = query.trim();
        if (trimmedQuery.length <= 2) {
          return;
        }

        _currentQuery = trimmedQuery;
        emit(SearchBookLoading());

        final result = await _booksRepository.searchBooks(trimmedQuery);

        if (_currentQuery != trimmedQuery) {
          return;
        }

        result.fold(
          (failure) => emit(SearchBookFailure(failure.errMessage)),
          (books) => emit(SearchBookSuccess(books)),
        );
      },
    );
  }
}
