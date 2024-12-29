import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class NowPlayingMoviesDataSource {
  Future<Map<String, dynamic>> getNowPlayingMovies(int page) async {
    DateTime oneMonthBefore = DateTime(
      DateTime.now().year,
      DateTime.now().month - 2,
      DateTime.now().day,
    );

    DateTime oneMonthAfter = DateTime(
      DateTime.now().year,
      DateTime.now().month + 1,
      DateTime.now().day,
    );
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverMoviesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'popularity.desc',
        'primary_release_date.gte':
            DateFormat('yyyy-MM-dd').format(oneMonthBefore),
        'primary_release_date.lte':
            DateFormat('yyyy-MM-dd').format(oneMonthAfter),
        'release_date.gte': DateFormat('yyyy-MM-dd').format(oneMonthBefore),
        'release_date.lte': DateFormat('yyyy-MM-dd').format(oneMonthAfter),
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
