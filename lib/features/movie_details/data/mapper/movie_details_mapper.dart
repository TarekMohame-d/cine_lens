import 'package:cine_rank/features/movie_details/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetailsMapper {
  static MovieDetailsEntity toEntity(MovieDetailsModel model) =>
      MovieDetailsEntity(
        backdropPath: model.backdropPath ?? '',
        budget: model.budget ?? 0,
        genres: model.genres ?? [],
        homepage: model.homepage ?? 'N/A',
        id: model.id ?? -1,
        originalLanguage: model.originalLanguage ?? 'N/A',
        originalTitle: model.originalTitle ?? 'N/A',
        overview: model.overview ?? 'N/A',
        popularity: model.popularity ?? 0.0,
        posterPath: model.posterPath ?? '',
        productionCompanies: model.productionCompanies ?? [],
        productionCountries: model.productionCountries ?? [],
        releaseDate: model.releaseDate ?? 'N/A',
        revenue: model.revenue ?? 0,
        runtime: model.runtime ?? 0,
        spokenLanguages: model.spokenLanguages ?? [],
        status: model.status ?? 'N/A',
        tagline: model.tagline ?? 'N/A',
        title: model.title ?? 'N/A',
        originCountry: model.originCountry ?? [],
        voteAverage: model.voteAverage ?? 0.0,
        voteCount: model.voteCount ?? 0,
      );
}
