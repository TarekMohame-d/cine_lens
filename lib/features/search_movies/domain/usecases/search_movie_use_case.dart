import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/search_movies/domain/repository/search_movie_repo.dart';

class SearchMovieUseCase {
  final SearchMovieRepo _searchMovieRepo;
  SearchMovieUseCase(this._searchMovieRepo);

  Future<ApiResult<List<MovieEntity>>> call(String query) async {
    return await _searchMovieRepo.getSearchMovies(query);
  }
}
