import 'package:dio/dio.dart';
import 'api_constants.dart';

class ApiService {
  final _baseUrl = ApiConstants.apiBaseUrl;
  final Dio _dio;
  ApiService({
    required Dio dio,
  }) : _dio = dio;

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
