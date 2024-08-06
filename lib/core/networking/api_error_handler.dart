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
  final code = data['status_code'];
  final message = data['status_message'] ?? "Unknown error occurred";

  switch (code) {
    case 200:
      return ApiErrorModel(
          success: false, statusCode: code, statusMessage: message);
    case 201:
      return ApiErrorModel(
          success: true,
          statusCode: code,
          statusMessage: "The item/record was updated successfully.");
    case 400:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Bad Request: $message");
    case 401:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Unauthorized: $message");
    case 403:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Forbidden: $message");
    case 404:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Not Found: $message");
    case 405:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Method Not Allowed: $message");
    case 422:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Unprocessable Entity: $message");
    case 429:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Too Many Requests: $message");
    case 500:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Internal Server Error: $message");
    case 502:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Bad Gateway: $message");
    case 503:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Service Unavailable: $message");
    case 504:
      return ApiErrorModel(
          success: false,
          statusCode: code,
          statusMessage: "Gateway Timeout: $message");
    default:
      return ApiErrorModel(
          success: false, statusCode: code, statusMessage: "Error: $message");
  }
}
