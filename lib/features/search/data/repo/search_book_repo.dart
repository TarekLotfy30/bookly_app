import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entity/search_book_entity.dart';
import '../data_source/remote_data_source/search_book_data_source.dart';

class SearchBookRepo {
  SearchBookRepo({required SearchBookDataSource searchBookDataSource})
    : _searchBookDataSource = searchBookDataSource;

  final SearchBookDataSource _searchBookDataSource;

  Future<Either<Failure, List<SearchBookEntity>>> searchBooks(
    String query,
  ) async {
    try {
      final result = await _searchBookDataSource.searchBooks(query);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Object catch (e) {
      return Left(ServerFailure('An unexpected error occurred: $e'));
    }
  }
}
