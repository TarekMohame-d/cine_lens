import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';

abstract class SeriesRepo {
  Future<ApiResult<List<SeriesEntity>>> getAiringTodaySeries(bool more);

  Future<ApiResult<List<SeriesEntity>>> getOnTheAirSeries(bool more);

  Future<ApiResult<List<SeriesEntity>>> getTopRatedSeries(bool more);

  Future<ApiResult<List<SeriesEntity>>> getMostPopularSeries(bool more);
}
