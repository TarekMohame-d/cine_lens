class MovieEntity {
  final String backdropPath;
  final int id;
  final int genreId;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  MovieEntity({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreId,
    required this.title,
  });
}
