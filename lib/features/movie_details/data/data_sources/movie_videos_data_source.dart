import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class MovieVideosDataSource {
  Future<Map<String, dynamic>> getMovieVideos(int movieId) async {
    final dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}/movie/$movieId/videos',
      queryParameters: {
        'language': 'en-US',
      },
    );
    return response.data;
  }
}
