import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<ApiResult<List<MovieEntity>>> getNowPlayingMovies(int page,
      [bool refresh = false]);

  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies(int page,
      [bool refresh = false]);

  Future<ApiResult<List<MovieEntity>>> getMostPopularMovies(int page,
      [bool refresh = false]);

  Future<ApiResult<List<MovieEntity>>> getUpcomingMovies(int page,
      [bool refresh = false]);
}
