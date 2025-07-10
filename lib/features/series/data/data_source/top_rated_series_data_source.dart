import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class TopRatedSeriesDataSource {
  Future<Map<String, dynamic>> getTopRatedSeries(int page) async {
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverSeriesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'vote_average.desc',
        'vote_average.gte': 7,
        'vote_count.gte': 3000,
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
