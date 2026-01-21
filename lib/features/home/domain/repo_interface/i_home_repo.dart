import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

abstract class IHomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();

  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  });
}
