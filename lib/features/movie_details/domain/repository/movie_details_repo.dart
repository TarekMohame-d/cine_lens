import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_videos_entity.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_watch_providers_entity.dart';

abstract class MovieDetailsRepo {
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId);

  Future<ApiResult<MovieCastEntity>> getMovieCastAndCrew(int movieId);

  Future<ApiResult<List<MovieVideosEntity>>> getMovieVideos(int movieId);

  // Future<ApiResult<MovieImagesModel>> getMovieImages({required int movieId});

  // Future<ApiResult<SimilarMoviesModel>> getSimilarMovies(
  //     {required int movieId});

  Future<ApiResult<MovieWatchProvidersEntity>> getMovieWatchProviders(
      int movieId);
}
