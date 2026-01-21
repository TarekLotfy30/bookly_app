import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book_entity.dart';
import '../repo_interface/i_home_repo.dart';

class FetchFeaturedBooksUseCase implements UseCase<List<BookEntity>, NoParams> {
  FetchFeaturedBooksUseCase(this._homeRepo);
  final IHomeRepo _homeRepo;

  @override
  Future<Either<Failure, List<BookEntity>>> call(NoParams params) async {
    return _homeRepo.fetchFeaturedBooks();
  }
}
