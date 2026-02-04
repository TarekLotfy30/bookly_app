import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({
    required FetchSimilarBooksUseCase fetchSimilarBooksUseCase,
  }) : _fetchSimilarBooksUseCase = fetchSimilarBooksUseCase,
       super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase _fetchSimilarBooksUseCase;

  Future<void> getSimilarBooks({required String category}) async {
    if (state is SimilarBooksSuccess) {
      return;
    }
    emit(SimilarBooksLoading());
    final result = await _fetchSimilarBooksUseCase.call(category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
