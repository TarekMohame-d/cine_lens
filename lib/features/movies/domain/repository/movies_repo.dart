import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<ApiResult<List<MovieEntity>>> getNowPlayingMovies(bool more);

  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies(bool more);

  Future<ApiResult<List<MovieEntity>>> getMostPopularMovies(bool more);

  Future<ApiResult<List<MovieEntity>>> getUpcomingMovies(bool more);
}
