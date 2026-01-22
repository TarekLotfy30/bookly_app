import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.fetchSimilarBooksUseCase})
    : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await fetchSimilarBooksUseCase.call(category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
