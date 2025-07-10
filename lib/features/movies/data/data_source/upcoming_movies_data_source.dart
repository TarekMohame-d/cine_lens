import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class UpcomingMoviesDataSource {
  Future<Map<String, dynamic>> getUpcomingMovies(int page) async {
    final now = DateTime.now();
    final halfMonthBefore = now.subtract(const Duration(days: 15));

    final oneMonthAfter = now.add(const Duration(days: 30));

    Dio dio = getIt<Dio>();

    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverMoviesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'primary_release_date.gte':
            DateFormat('yyyy-MM-dd').format(halfMonthBefore),
        'primary_release_date.lte':
            DateFormat('yyyy-MM-dd').format(oneMonthAfter),
        'release_date.gte': DateFormat('yyyy-MM-dd').format(halfMonthBefore),
        'release_date.lte': DateFormat('yyyy-MM-dd').format(oneMonthAfter),
        'sort_by': 'vote_count.desc',
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
