import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class MostPopularMoviesDataSource {
  Future<Map<String, dynamic>> getMostPopularMovies(int page) async {
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}/movie/popular',
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
