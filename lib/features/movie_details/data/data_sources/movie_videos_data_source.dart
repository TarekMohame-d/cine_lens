import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class MovieVideosDataSource {
  Future<Map<String, dynamic>> getMovieVideos(int movieId) async {
    final dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.movieVideosEndpoint}$movieId/videos',
      queryParameters: {
        'language': 'en-US',
      },
    );
    return response.data;
  }
}
