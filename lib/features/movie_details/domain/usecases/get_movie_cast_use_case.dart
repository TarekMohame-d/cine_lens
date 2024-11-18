import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:cine_rank/features/movie_details/domain/repository/movie_details_repo.dart';

class GetMovieCastUseCase {
  final MovieDetailsRepo _movieDetailsRepo;

  GetMovieCastUseCase(this._movieDetailsRepo);

  Future<ApiResult<MovieCastEntity>> call(int movieId) async {
    return await _movieDetailsRepo.getMovieCastAndCrew(movieId);
  }
}
