import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<ApiResult<List<MovieEntity>>> getNowPlayingMovies([bool more = false]);

  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies([bool more = false]);

  Future<ApiResult<List<MovieEntity>>> getMostPopularMovies(
      [bool more = false]);

  Future<ApiResult<List<MovieEntity>>> getUpcomingMovies([bool more = false]);
}
