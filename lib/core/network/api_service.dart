import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getData({
    required String endPoint,
    String? apiKey,
    Map<String, dynamic>? params,
  }) async {
    var response = await _dio.get(
      endPoint,
      queryParameters: params,
    );
    return response.data;
  }
}
