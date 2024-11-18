class MovieEntity {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final int? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;

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
