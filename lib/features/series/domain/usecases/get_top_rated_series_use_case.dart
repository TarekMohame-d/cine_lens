import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/domain/repository/series_repo.dart';

class GetTopRatedSeriesUseCase {
  final SeriesRepo _seriesRepo;

  GetTopRatedSeriesUseCase(this._seriesRepo);

  Future<ApiResult<List<SeriesEntity>>> call(bool more) async {
    return await _seriesRepo.getTopRatedSeries(more);
  }
}
