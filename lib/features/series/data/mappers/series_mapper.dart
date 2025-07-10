import 'package:cine_lens/core/helpers/extensions.dart';
import 'package:cine_lens/features/series/data/models/series_model.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';

class SeriesMapper {
  static SeriesEntity toEntity(SeriesData seriesData) => SeriesEntity(
      id: seriesData.id ?? -1,
      name: seriesData.name ?? 'N/A',
      overview: seriesData.overview ?? 'N/A',
      posterPath: seriesData.posterPath ?? '',
      backdropPath: seriesData.backdropPath ?? '',
      voteAverage: seriesData.voteAverage ?? 0.0,
      voteCount: seriesData.voteCount ?? 0,
      firstAirDate: seriesData.firstAirDate ?? 'N/A',
      genreId: !seriesData.genreIds.isNullOrEmpty()
          ? seriesData.genreIds?.first ?? -1
          : -1,
      originalLanguage: seriesData.originalLanguage ?? 'N/A',
      originalName: seriesData.originalName ?? 'N/A',
      popularity: seriesData.popularity ?? 0.0);
}
