import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.useCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase useCase;

  Future<void> fetchFeaturedBooks() async {
    if (state is FeaturedBooksSuccess) {
      return;
    }
    emit(FeaturedBooksLoading());
    final result = await useCase.call(NoParams());
    result.fold(
      (failure) => emit(FeaturedBooksFailure(failure.errMessage)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
