import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class UpcomingMoviesDataSource {
  Future<Map<String, dynamic>> getUpcomingMovies(int page) async {
    DateTime oneMonthBefore = DateTime(
      DateTime.now().year,
      DateTime.now().month - 1,
      DateTime.now().day,
    );

    DateTime oneMonthAfter = DateTime(
      DateTime.now().year,
      DateTime.now().month + 1,
      DateTime.now().day,
    );

    Dio dio = getIt<Dio>();
    
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.upcomingMoviesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'year': oneMonthAfter.year.toString(),
        'release_date.gte': DateFormat('yyyy-MM-dd').format(oneMonthAfter),
        'release_date.lte': DateFormat('yyyy-MM-dd').format(oneMonthBefore),
      },
    );
    return response.data;
  }
}
