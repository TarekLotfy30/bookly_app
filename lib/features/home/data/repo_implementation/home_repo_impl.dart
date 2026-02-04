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
      final featuredBooks = await _remoteDataSource.fetchFeaturedBooks();
      return Right(featuredBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Object catch (e) {
      return Left(ServerFailure('An unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      final newestBooks = await _remoteDataSource.fetchNewestBooks();
      return Right(newestBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Object catch (e) {
      return Left(ServerFailure('An unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final similarBooks = await _remoteDataSource.fetchSimilarBooks(
        category: category,
      );
      return Right(similarBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Object catch (e) {
      return Left(ServerFailure('An unexpected error occurred: $e'));
    }
  }
}
