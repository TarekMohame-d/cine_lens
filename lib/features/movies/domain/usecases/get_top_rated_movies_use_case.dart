import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/domain/repository/movies_repo.dart';

class GetTopRatedMoviesUseCase {
  final MoviesRepo _moviesRepo;

  GetTopRatedMoviesUseCase(this._moviesRepo);

  Future<ApiResult<List<MovieEntity>>> call(bool more) async {
    return await _moviesRepo.getTopRatedMovies(more);
  }
}
