import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book_entity.dart';
import '../repo_interface/i_home_repo.dart';

class FetchSimilarBooksUseCase implements UseCase<List<BookEntity>, String> {
  FetchSimilarBooksUseCase(this._homeRepo);
  final IHomeRepo _homeRepo;

  @override
  Future<Either<Failure, List<BookEntity>>> call(String category) async {
    return _homeRepo.fetchSimilarBooks(category: category);
  }
}
