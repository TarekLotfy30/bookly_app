import 'package:dio/dio.dart';

import '../../../../../constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/local/hive_local_storage.dart';
import '../../../../../core/services/network/api_service.dart';
import '../../../../../core/services/network/endpoints.dart';
import '../../models/book_response_model/book_response_model.dart';
import '../../models/book_response_model/item.dart';
import 'i_home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<List<Item>> fetchFeaturedBooks() async {
    final responseData = await _apiService.getData(
      endPoint: EndPoints.volume,
      queryParams: {'Filtering': 'free-ebooks', 'q': 'subject:Programming'},
    );

    return checkAndParsing(responseData);
  }

  @override
  Future<List<Item>> fetchNewestBooks() async {
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
  Future<List<Item>> fetchSimilarBooks({required String category}) async {
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

  Future<List<Item>> checkAndParsing(
    Response<Map<String, dynamic>> responseData,
  ) async {
    if (responseData.statusCode == 200) {
      if (responseData.data?['items'] == null) {
        throw ServerFailure('No data found');
      }

      final BookResponseModel bookModel = BookResponseModel.fromJson(
        responseData.data!,
      );

      // save to Hive

      await HiveHelper.addAll<Item>(
        values: bookModel.items!,
        boxName: bookHiveBox,
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
