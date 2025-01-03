import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cine_lens/features/movie_details/domain/repository/movie_details_repo.dart';

class GetMovieDetailsUseCase {
  final MovieDetailsRepo _movieDetailsRepo;
  GetMovieDetailsUseCase(this._movieDetailsRepo);

  Future<ApiResult<MovieDetailsEntity>> call(int movieId) async {
    return await _movieDetailsRepo.getMovieDetails(movieId);
  }
}
