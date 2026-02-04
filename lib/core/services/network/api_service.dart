import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  ApiService(this._dio) {
    const timeOut = Duration(seconds: 30);
    _dio.options = BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
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
      ),
    );
  }

  Future<Response<Map<String, dynamic>>> get({
    required String endPoint,
    required Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        endPoint,
        queryParameters: params,
        data: body, // Body can be sent with GET requests in some APIs
      );
      return response;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
