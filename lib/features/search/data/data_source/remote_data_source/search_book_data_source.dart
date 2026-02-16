import 'package:dio/dio.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/network/api_service.dart';
import '../../../../../core/services/network/endpoints.dart';
import '../../../domain/entity/search_book_entity.dart';
import '../../models/search_response_model/search_response_model.dart';

class SearchBookDataSource {
  SearchBookDataSource({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  Future<List<SearchBookEntity>> searchBooks(String query) async {
    final responseData = await _apiService.get(
      endPoint: EndPoints.volumes,
      params: {'q': query, "maxResults": '20'},
    );

    if (responseData.statusCode == 200) {
      final data = responseData.data;

      if (data == null) {
        throw ServerFailure('Response data is null');
      }

      if (data['items'] == null) {
        throw ServerFailure('No books found in response');
      }

      final bookModel = SearchResponseModel.fromJson(responseData.data!);

      if (bookModel.items == null || bookModel.items!.isEmpty) {
        throw ServerFailure('Book list is empty');
      }

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
