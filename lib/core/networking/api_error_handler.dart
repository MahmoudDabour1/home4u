import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.statusCode, error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unexpected error occurred");
    }
  }

  static ApiErrorModel _handleError(int? statusCode, dynamic error) {
    if (error is String && error.contains('<html')) {
      return ApiErrorModel(
        message: "Received an HTML response instead of JSON. Possible server error.",
        statusCode: statusCode,
      );
    }
    return ApiErrorModel(
      message: error['message'] ?? "Unknown error occurred",
      statusCode: statusCode,
      errorsDetails: (error['details'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );
  }
}
