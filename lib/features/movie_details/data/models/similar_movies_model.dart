// import 'package:json_annotation/json_annotation.dart';
// part '../../../movies/data/models/similar_movies_model.g.dart';

// @JsonSerializable()
// class SimilarMoviesModel {
//   int? page;
//   @JsonKey(name: 'results')
//   List<SimilarMovieDetails>? similarMovieDetails;
//   @JsonKey(name: 'total_pages')
//   int? totalPages;
//   @JsonKey(name: 'total_results')
//   int? totalResults;

//   SimilarMoviesModel({
//     this.page,
//     this.similarMovieDetails,
//     this.totalPages,
//     this.totalResults,
//   });

//   factory SimilarMoviesModel.fromJson(Map<String, dynamic> json) =>
//       _$SimilarMoviesModelFromJson(json);
//   Map<String, dynamic> toJson() => _$SimilarMoviesModelToJson(this);
// }

// @JsonSerializable()
// class SimilarMovieDetails {
//   bool? adult;
//   @JsonKey(name: 'backdrop_path')
//   String? backdropPath;
//   @JsonKey(name: 'genre_ids')
//   List<int>? genreIds;
//   int? id;
//   @JsonKey(name: 'original_language')
//   String? originalLanguage;
//   @JsonKey(name: 'original_title')
//   String? originalTitle;
//   String? overview;
//   double? popularity;
//   @JsonKey(name: 'poster_path')
//   String? posterPath;
//   @JsonKey(name: 'release_date')
//   String? releaseDate;
//   String? title;
//   bool? video;
//   @JsonKey(name: 'vote_average')
//   double? voteAverage;
//   @JsonKey(name: 'vote_count')
//   int? voteCount;

//   SimilarMovieDetails({
//     this.adult,
//     this.backdropPath,
//     this.genreIds,
//     this.id,
//     this.originalLanguage,
//     this.originalTitle,
//     this.overview,
//     this.popularity,
//     this.posterPath,
//     this.releaseDate,
//     this.title,
//     this.video,
//     this.voteAverage,
//     this.voteCount,
//   });

//   factory SimilarMovieDetails.fromJson(Map<String, dynamic> json) =>
//       _$SimilarMovieDetailsFromJson(json);
//   Map<String, dynamic> toJson() => _$SimilarMovieDetailsToJson(this);
// }
