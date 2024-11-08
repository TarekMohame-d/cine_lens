import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      Duration timeOut = const Duration(seconds: 30);
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      _addDioHeaders();
      _addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addDioHeaders() async {
    dio?.options.headers = {
      'accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMDlmOGVmNDljMTQ4MzU5NDg3NGYxOTgwNmY2YWEwOCIsIm5iZiI6MTcyMTExODEwNS42Njk0NTIsInN1YiI6IjY1Y2RjMGU3NTFlNmFiMDE0YTFlZTdlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ckWbo6EY3exyykqVL-K-ZFk1th82v7eqLCtqufSHvEs',
    };
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
