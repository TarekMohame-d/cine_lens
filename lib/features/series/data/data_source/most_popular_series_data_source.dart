import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class MostPopularSeriesDataSource {
  Future<Map<String, dynamic>> getMostPopularSeries(int page) async {
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}/tv/popular',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'popularity.desc',
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
