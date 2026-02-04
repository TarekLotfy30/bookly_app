import 'package:dio/dio.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/network/api_service.dart';
import '../../../../../core/services/network/endpoints.dart';
import '../../../domain/entities/book_entity.dart';
import '../../models/book_response_model/book_response_model.dart';
import 'i_home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final responseData = await _apiService.get(
      endPoint: EndPoints.volume,
      params: {'Filtering': 'free-ebooks', 'q': 'subject:Programming'},
    );

    return checkAndParsing(responseData);
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final responseData = await _apiService.get(
      endPoint: EndPoints.volume,
      params: {
        'Filtering': 'free-ebooks',
        'Sorting': 'newest',
        'q': 'computer science',
      },
    );

    return checkAndParsing(responseData);
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    final responseData = await _apiService.get(
      endPoint: EndPoints.volume,
      params: {
        'Filtering': 'free-ebooks',
        'Sorting': 'relevance',
        'q': category, // subject:Programming
      },
    );
    return checkAndParsing(responseData);
  }

  Future<List<BookEntity>> checkAndParsing(
    Response<Map<String, dynamic>> responseData,
  ) async {
    if (responseData.statusCode == 200) {
      final data = responseData.data;

      if (data == null) {
        throw ServerFailure('Response data is null');
      }

      if (data['items'] == null) {
        throw ServerFailure('No books found in response');
      }

      final bookModel = BookResponseModel.fromJson(responseData.data!);

      if (bookModel.items == null || bookModel.items!.isEmpty) {
        throw ServerFailure('Book list is empty');
      }

      // save to Hive
      // await HiveHelper.addAll<Item>(
      //   values: bookModel.items!,
      //   boxName: bookHiveBox,
      // );

      // Items are already BookEntity (since Item extends BookEntity)
      return bookModel.items!;
    } else {
      // Let Dio handle non-200 status codes
      throw DioException(
        requestOptions: responseData.requestOptions,
        response: responseData,
        type: DioExceptionType.badResponse,
        error: 'HTTP ${responseData.statusCode}',
      );
    }
  }
}
