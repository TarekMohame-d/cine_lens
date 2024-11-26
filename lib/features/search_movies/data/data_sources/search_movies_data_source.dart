import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class SearchMoviesDataSource {
  Future<Map<String, dynamic>> getSearchMovies(String query) async {
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.searchMoviesEndpoint}',
      queryParameters: {
        'query': query,
        'language': 'en-US',
        'page': 1,
        'sort_by': 'popularity.desc',
      },
    );
    return response.data;
  }
}
