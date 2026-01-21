import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repo_interface/i_home_repo.dart';
import '../data_sources/remote_data_source/i_home_remote_data_source.dart';

class HomeRepoImpl implements IHomeRepo {
  HomeRepoImpl({required IHomeRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final IHomeRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      final books = await _remoteDataSource.fetchFeaturedBooks();
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      final books = await _remoteDataSource.fetchNewestBooks();
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      return Right(
        await _remoteDataSource.fetchSimilarBooks(category: category),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
