import 'package:dio/dio.dart';

import '../../../../../core/network/api_service.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../domain/entities/book_entity.dart';
import '../../models/book_response_model/book_response_model.dart';
import 'i_home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final responseData = await _apiService.getData(
      endPoint: EndPoints.volume,
      queryParams: {'Filtering': 'free-ebooks', 'q': 'subject:Programming'},
    );

    return checkAndParsing(responseData);
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final responseData = await _apiService.getData(
      endPoint: EndPoints.volume,
      queryParams: {
        'Filtering': 'free-ebooks',
        'Sorting': 'newest',
        'q': 'computer science',
      },
    );

    return checkAndParsing(responseData);
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    final data = await _apiService.getData(
      endPoint: EndPoints.volume,
      queryParams: {
        'Filtering': 'free-ebooks',
        'Sorting': 'relevance',
        'q': category, // subject:Programming
      },
    );
    return checkAndParsing(data);
  }

  List<BookEntity> checkAndParsing(
    Response<Map<String, dynamic>> responseData,
  ) {
    if (responseData.statusCode == 200) {
      if (responseData.data?['items'] == null) {
        throw Exception('No data found');
      }

      final BookResponseModel bookModel = BookResponseModel.fromJson(
        responseData.data!,
      );
      // Items are already BookEntity (since Item extends BookEntity)
      return bookModel.items!;
    } else {
      throw DioException(
        requestOptions: responseData.requestOptions,
        response: responseData,
        stackTrace: StackTrace.current,
      );
    }
  }
}
