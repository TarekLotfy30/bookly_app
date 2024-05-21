import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getData({
    required String endPoint,
    String? apiKey,
    Map<String, dynamic>? params,
  }) async {
    var response = await _dio.get(
      endPoint,
      queryParameters: params,
    );
    print("Iam in ApiService (DioHelper)");
    print(response.data);
    print(response.statusCode);
    print(response.statusMessage);
    print(response.headers);
    return response.data;
  }
}
