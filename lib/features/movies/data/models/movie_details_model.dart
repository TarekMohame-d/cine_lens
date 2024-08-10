import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompanies>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountries>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  int? revenue;
  int? runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

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

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}

@JsonSerializable()
class BelongsToCollection {
  int? id;
  String? name;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

@JsonSerializable()
class Genres {
  int? id;
  String? name;

  Genres({
    this.id,
    this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class ProductionCompanies {
  int? id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  String? name;
  @JsonKey(name: 'origin_country')
  String? originCountry;

  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable()
class ProductionCountries {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  String? name;

  ProductionCountries({
    this.iso31661,
    this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}

@JsonSerializable()
class SpokenLanguages {
  @JsonKey(name: 'english_name')
  String? englishName;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  String? name;

  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}
