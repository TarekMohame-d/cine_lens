import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class TopRatedMoviesDataSource {
  Future<Map<String, dynamic>> getTopRatedMovies(int page) async {
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverMoviesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'vote_average.desc',
        'vote_average.gte': 8,
        'vote_average.lte': 9.8,
        'vote_count.gte': 10000,
        'include_video': 'false',
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
