import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class UpcomingMoviesDataSource {
  Future<Map<String, dynamic>> getUpcomingMovies(int page) async {
    DateTime halfMonthBefore = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 15,
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
        'year': oneMonthAfter.year.toString(),
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
