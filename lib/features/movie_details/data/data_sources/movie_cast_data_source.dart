import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class MovieCastDataSource {
  Future<Map<String, dynamic>> getMovieCastAndCrew(int movieId) async {
    final dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.movieCastAndCrewEndpoint}$movieId/credits',
      queryParameters: {
        'language': 'en-US',
        'sort_by': 'popularity.desc',
      },
    );
    return response.data;
  }
}
