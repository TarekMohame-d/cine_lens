import 'package:cine_rank/core/networking/api_error_model.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_videos_entity.dart';
import 'package:cine_rank/features/movie_details/domain/repository/movie_details_repo.dart';

class GetMovieVideoUseCase {
  final MovieDetailsRepo _movieDetailsRepo;

  GetMovieVideoUseCase(this._movieDetailsRepo);

  Future<ApiResult<String>> call(int movieId) async {
    ApiResult<List<MovieVideosEntity>> result =
        await _movieDetailsRepo.getMovieVideos(movieId);
    if (result.isSuccess) {
      for (var video in result.data!) {
        if (video.type == 'Trailer' &&
            video.official == true &&
            video.key.isNotEmpty) {
          return ApiResult.success(video.key);
        }
      }
    }
    return ApiResult.failure(ApiErrorModel(statusMessage: "Trailer not found"));
  }
}
