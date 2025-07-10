import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/movies/domain/entities/movie_entity.dart';

abstract class SearchMovieRepo {
  Future<ApiResult<List<MovieEntity>>> getSearchMovies(String query);
}
