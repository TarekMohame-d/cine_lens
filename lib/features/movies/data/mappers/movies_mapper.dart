import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';

class MoviesMapper {
  static MovieEntity mapToEntity(MovieData data) {
    return MovieEntity(
      adult: data.adult,
      id: data.id,
      backdropPath: data.backdropPath,
      originalLanguage: data.originalLanguage,
      originalTitle: data.originalTitle,
      popularity: data.popularity,
      posterPath: data.posterPath,
      releaseDate: data.releaseDate,
      voteAverage: data.voteAverage,
      genreIds:
          !data.genreIds.isNullOrEmpty() ? data.genreIds?.first ?? -1 : -1,
    );
  }
}
