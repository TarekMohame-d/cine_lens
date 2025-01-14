import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class MostPopularMoviesDataSource {
  Future<Map<String, dynamic>> getMostPopularMovies(int page) async {
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverMoviesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'popularity.desc',
        'vote_average.gte': 8,
        'vote_count.gte': 10000,
        'include_video': 'false',
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
