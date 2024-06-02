import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  ApiService(this._dio) {
    const Duration timeOut = Duration(seconds: 30);
    _dio.options = BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      responseType: ResponseType.json,
      validateStatus: (status) => status! < 500,
    );
    addDioInterceptor();
  }

  final Dio _dio;

  void addDioInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  Future<Map<String, dynamic>> getData({
    required String endPoint,
    String? apiKey,
    Map<String, dynamic>? params,
  }) async {
    final response = await _dio.get(
      endPoint,
      queryParameters: params,
    );
    return response.data;
  }
}
