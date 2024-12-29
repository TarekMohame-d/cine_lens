import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';

class MoviesMapper {
  static MovieEntity toEntity(MovieData data) {
    return MovieEntity(
      id: data.id ?? -1,
      backdropPath: data.backdropPath ?? '',
      originalLanguage: data.originalLanguage ?? 'N/A',
      originalTitle: data.originalTitle ?? 'N/A',
      popularity: data.popularity ?? 0.0,
      posterPath: data.posterPath ?? '',
      releaseDate: data.releaseDate ?? 'N/A',
      voteAverage: data.voteAverage ?? 0.0,
      genreIds:
          !data.genreIds.isNullOrEmpty() ? data.genreIds?.first ?? -1 : -1,
    );
  }
}
