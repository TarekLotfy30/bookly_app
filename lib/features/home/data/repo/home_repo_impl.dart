import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repo_interface/i_home_repo.dart';
import '../models/book_response_model/book_response_model.dart';

class HomeRepoImpl implements IHomeRepo {
  HomeRepoImpl({required ApiService apiService}) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      final responseData = await _apiService.getData(
        endPoint: EndPoints.featuredBooks,
      );

      if (responseData.statusCode == 200) {
        if (responseData.data?['items'] == null) {
          return left(ServerFailure('No data found'));
        }
        final BookResponseModel bookModel = BookResponseModel.fromJson(
          responseData.data!,
        );

        return right(bookModel.items!);
      } else {
        return left(ServerFailure(responseData.statusMessage ?? ''));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      final data = await _apiService.getData(endPoint: EndPoints.newestBooks);
      final List<BookResponseModel> books = [];
      for (final item in data['items']) {
        books.add(BookResponseModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final data = await _apiService.getData(endPoint: EndPoints.similarBooks);
      final List<BookResponseModel> books = [];
      for (final item in data['items']) {
        books.add(BookResponseModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
