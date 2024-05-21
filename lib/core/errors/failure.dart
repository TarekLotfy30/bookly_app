import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          return ServerFailure.fromResponse(
            dioError.response!.statusCode,
            dioError.response!.data,
          );
        }
        return ServerFailure('Response was null');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    const statusBadRequest = 400;
    const statusUnauthorized = 401;
    const statusForbidden = 403;
    const statusNotFound = 404;
    const statusInternalServerError = 500;
    switch (statusCode) {
      case statusBadRequest:
      case statusUnauthorized:
      case statusForbidden:
        return ServerFailure(response['error']['message']);
      case statusNotFound:
        return ServerFailure('Your request not found, Please try later!');
      case statusInternalServerError:
        return ServerFailure('Internal Server error, Please try later');
      default:
        return ServerFailure(
          'Unknown status code: $statusCode Opps There was an Error,'
          ' Please try again',
        );
    }
  }
}
