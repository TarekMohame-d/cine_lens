import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
          dotenv.env['API_KEY'],
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
