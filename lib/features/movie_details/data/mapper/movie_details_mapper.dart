import 'package:cine_rank/features/movie_details/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetailsMapper {
  static MovieDetailsEntity toEntity(MovieDetailsModel model) =>
      MovieDetailsEntity(
        backdropPath: model.backdropPath,
        budget: model.budget,
        genres: model.genres,
        homepage: model.homepage,
        id: model.id,
        originalLanguage: model.originalLanguage,
        originalTitle: model.originalTitle,
        overview: model.overview,
        popularity: model.popularity,
        posterPath: model.posterPath,
        productionCompanies: model.productionCompanies,
        productionCountries: model.productionCountries,
        releaseDate: model.releaseDate,
        revenue: model.revenue,
        runtime: model.runtime,
        spokenLanguages: model.spokenLanguages,
        status: model.status,
        tagline: model.tagline,
        title: model.title,
        belongsToCollection: model.belongsToCollection,
        originCountry: model.originCountry,
        voteAverage: model.voteAverage,
        voteCount: model.voteCount,
      );
}
