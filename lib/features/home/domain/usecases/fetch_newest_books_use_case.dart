import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book_entity.dart';
import '../repo_interface/i_home_repo.dart';

class FetchNewestBooksUseCase implements UseCase<List<BookEntity>, NoParams> {
  FetchNewestBooksUseCase(this._homeRepo);
  final IHomeRepo _homeRepo;

  @override
  Future<Either<Failure, List<BookEntity>>> call(NoParams params) async {
    return _homeRepo.fetchNewestBooks();
  }
}
