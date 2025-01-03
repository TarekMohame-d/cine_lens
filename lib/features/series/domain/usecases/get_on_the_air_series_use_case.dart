import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/domain/repository/series_repo.dart';

class GetOnTheAirSeriesUseCase {
  final SeriesRepo seriesRepo;

  GetOnTheAirSeriesUseCase(this.seriesRepo);

  Future<ApiResult<List<SeriesEntity>>> call(bool more) async {
    return await seriesRepo.getOnTheAirSeries(more);
  }
}
