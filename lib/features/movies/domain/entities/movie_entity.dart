class MovieEntity {
  bool? adult;
  String? backdropPath;
  int? id;
  int? genreIds;
  String? originalLanguage;
  String? originalTitle;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;

  MovieEntity({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.genreIds,
  });
}
