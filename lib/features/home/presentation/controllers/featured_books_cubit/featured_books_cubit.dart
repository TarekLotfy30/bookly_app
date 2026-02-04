import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._useCase) : super(FeaturedBooksInitial());
  // final FetchFeaturedBooksUseCase _useCase;
  final FetchFeaturedBooksUseCase _useCase;

  Future<void> fetchFeaturedBooks({bool forceRefresh = false}) async {
    if (state is FeaturedBooksSuccess && !forceRefresh) {
      return;
    }
    emit(FeaturedBooksLoading());
    final result = await _useCase.call(NoParams());
    result.fold(
      (failure) => emit(FeaturedBooksFailure(failure.errMessage)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }

  Future<void> retry() async {
    await fetchFeaturedBooks(forceRefresh: true);
  }
}
