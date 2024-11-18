import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieDetailsModel {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompanies>? productionCompanies;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountries>? productionCountries;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class BelongsToCollection {
  final int? id;
  final String? name;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@JsonSerializable(createToJson: false)
class Genres {
  final int? id;
  final String? name;

  Genres({
    this.id,
    this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProductionCompanies {
  final int? id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  final String? name;
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProductionCountries {
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;

  ProductionCountries({
    this.iso31661,
    this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);
}

@JsonSerializable(createToJson: false)
class SpokenLanguages {
  @JsonKey(name: 'english_name')
  final String? englishName;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  final String? name;

  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);
}
