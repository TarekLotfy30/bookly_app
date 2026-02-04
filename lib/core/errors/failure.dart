import 'package:dio/dio.dart';

/// Base class for all failures in the application.
abstract class Failure {
  /// Creates a new [Failure] with the given [errMessage].
  const Failure(this.errMessage);

  /// The error message associated with the failure.
  final String errMessage;
}

/// Represents failures that occur during server communication.
class ServerFailure extends Failure {
  /// Creates a new [ServerFailure] with the given [errMessage].
  ServerFailure(super.errMessage);

  /// Creates a [ServerFailure] from a [DioException].
  factory ServerFailure.fromDioError(final DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate from ApiServer');

      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          return ServerFailure.fromResponse(
            dioError.response!.statusCode,
            dioError.response!.data as Map<String, dynamic>,
          );
        }
        return ServerFailure('Response was null');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      // default:
      //   return ServerFailure('Oops There was an Error, Please try again');
    }
  }

  /// Creates a [ServerFailure] based on the HTTP response status code and data.
  factory ServerFailure.fromResponse(
    final int? statusCode,
    final Map<String, dynamic> response,
  ) {
    const statusBadRequest = 400;
    const statusUnauthorized = 401;
    const statusForbidden = 403;
    const statusNotFound = 404;
    const statusInternalServerError = 500;
    switch (statusCode) {
      case statusBadRequest:
      case statusUnauthorized:
      case statusForbidden:
        // ignore: avoid_dynamic_calls
        return ServerFailure(response['error']['message'] as String);
      case statusNotFound:
        return ServerFailure('Your request not found, Please try later!');
      case statusInternalServerError:
        return ServerFailure('Internal Server error, Please try later');
      default:
        return ServerFailure(
          'Unknown status code: $statusCode Oops There was an Error,'
          ' Please try again',
        );
    }
  }
}
