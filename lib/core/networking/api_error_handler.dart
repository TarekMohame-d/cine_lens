import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(statusMessage: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(
              statusMessage: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              statusMessage: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              statusMessage:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              statusMessage: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              statusMessage: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(statusMessage: "Something went wrong");
      }
    } else {
      return ApiErrorModel(statusMessage: "Unknown error occurred");
    }
  }

  static ApiErrorModel _handleError(dynamic data) {
    final statusCode = data['status_code'] ?? -1;
    final statusMessage = data['status_message'] ?? 'Unknown error occurred';

    return ApiErrorModel(statusCode: statusCode, statusMessage: statusMessage);
  }
}
