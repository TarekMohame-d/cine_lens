import 'package:json_annotation/json_annotation.dart';

part 'series_model.g.dart';

@JsonSerializable(createToJson: false)
class SeriesModel {
  final int? page;
  @JsonKey(name: 'results')
  final List<SeriesData>? series;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  SeriesModel({
    this.page,
    this.series,
    this.totalPages,
    this.totalResults,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SeriesData {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  final String? name;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  SeriesData({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory SeriesData.fromJson(Map<String, dynamic> json) =>
      _$SeriesDataFromJson(json);
}
