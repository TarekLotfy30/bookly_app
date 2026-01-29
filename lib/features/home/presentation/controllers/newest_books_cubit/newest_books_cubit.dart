import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase _fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({bool forceRefresh = false}) async {
    if (state is NewestBooksSuccess && !forceRefresh) {
      return;
    }

    emit(NewestBooksLoading());

    final result = await _fetchNewestBooksUseCase.call(NoParams());

    result.fold(
      (failure) => emit(NewestBooksFailure(failure.errMessage)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }

  Future<void> refreshNewestBooks() async {
    await fetchNewestBooks(forceRefresh: true);
  }
}
