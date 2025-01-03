import 'package:cine_lens/core/di/dependency_injection.dart';
import 'package:cine_lens/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class AiringTodaySeriesDataSource {
  Future<Map<String, dynamic>> getAiringTodaySeries(int page) async {
    Dio dio = getIt<Dio>();
    final response = await dio.get(
      '${KApiConstants.apiBaseUrl}${KApiConstants.discoverSeriesEndpoint}',
      queryParameters: {
        'language': 'en-US',
        'page': page,
        'sort_by': 'vote_count.desc',
        'air_date.gte': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'air_date.lte': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'include_adult': 'false',
      },
    );
    return response.data;
  }
}
