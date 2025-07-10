import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class NowPlayingMoviesDataSource {
  Future<Map<String, dynamic>> getNowPlayingMovies(int page) async {
    final now = DateTime.now();

    final before = now.subtract(const Duration(days: 60));

    final after = now.add(const Duration(days: 30));
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverMoviesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'popularity.desc',
        'primary_release_date.gte': DateFormat('yyyy-MM-dd').format(before),
        'primary_release_date.lte': DateFormat('yyyy-MM-dd').format(after),
        'release_date.gte': DateFormat('yyyy-MM-dd').format(before),
        'release_date.lte': DateFormat('yyyy-MM-dd').format(after),
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
