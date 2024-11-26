import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movie_details/domain/repository/movie_details_repo.dart';

class GetMovieWatchProvidersUseCase {
  final MovieDetailsRepo _movieDetailsRepo;

  GetMovieWatchProvidersUseCase(this._movieDetailsRepo);

  Future<ApiResult<String>> call(int movieId) async {
    String url = 'https://www.themoviedb';
    final result = await _movieDetailsRepo.getMovieWatchProviders(movieId);
    if (result.isSuccess) {
      url = result.data?.results?['US']?.link ?? 'https://www.themoviedb';
    }
    return ApiResult.success(url);
  }
}
