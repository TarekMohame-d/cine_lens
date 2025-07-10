import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_lens/features/movies/domain/repository/movies_repo.dart';

class GetUpcomingMoviesUseCase {
  final MoviesRepo _moviesRepo;

  GetUpcomingMoviesUseCase(this._moviesRepo);

  Future<ApiResult<List<MovieEntity>>> call(bool more) async {
    return await _moviesRepo.getUpcomingMovies(more);
  }
}
