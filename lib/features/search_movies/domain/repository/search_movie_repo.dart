import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';

abstract class SearchMovieRepo {
  Future<ApiResult<List<MovieEntity>>> getSearchMovies(String query);
}
