import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class OnTheAirSeriesDataSource {
  Future<Map<String, dynamic>> getOnTheAirSeries(int page) async {
    DateTime now = DateTime.now();

    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverSeriesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'vote_count.desc',
        'air_date.gte': DateFormat('yyyy-MM-dd').format(startOfWeek),
        'air_date.lte': DateFormat('yyyy-MM-dd').format(endOfWeek),
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
