import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/domain/repository/movies_repo.dart';

class GetMostPopularMoviesUseCase {
  final MoviesRepo _moviesRepo;

  GetMostPopularMoviesUseCase(this._moviesRepo);

  Future<ApiResult<List<MovieEntity>>> call(int page,
      [bool refresh = false]) async {
    return await _moviesRepo.getMostPopularMovies(page, refresh);
  }
}
