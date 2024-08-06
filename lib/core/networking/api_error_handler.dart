import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
              success: false, statusMessage: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(
              success: false,
              statusMessage: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              success: false,
              statusMessage: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              success: false,
              statusMessage:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              success: false,
              statusMessage: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              success: false,
              statusMessage: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(
              success: false, statusMessage: "Something went wrong");
      }
    } else {
      return ApiErrorModel(
          success: false, statusMessage: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
      success: false,
      statusCode: data['status_code'] ?? -1,
      statusMessage: data['status_message'] ?? "Unknown error occurred");
}
