part of 'movies_details_cubit.dart';

@immutable
sealed class MoviesDetailsState {}

final class MoviesDetailsInitial extends MoviesDetailsState {}

final class GetMovieDetailsLoading extends MoviesDetailsState {}

final class GetMovieDetailsSuccess extends MoviesDetailsState {
  final MovieDetailsEntity movieDetails;

  GetMovieDetailsSuccess(this.movieDetails);
}

final class GetMovieDetailsFailure extends MoviesDetailsState {
  final ApiErrorModel apiErrorModel;

  GetMovieDetailsFailure(this.apiErrorModel);
}

final class GetMovieVideosLoading extends MoviesDetailsState {}

final class GetMovieVideosSuccess extends MoviesDetailsState {
  final String videoLink;

  GetMovieVideosSuccess(this.videoLink);
}

final class GetMovieVideosFailure extends MoviesDetailsState {
  final ApiErrorModel apiErrorModel;

  GetMovieVideosFailure(this.apiErrorModel);
}

final class GetMovieCastLoading extends MoviesDetailsState {}

final class GetMovieCastSuccess extends MoviesDetailsState {
  final MovieCastEntity cast;

  GetMovieCastSuccess(this.cast);
}

final class GetMovieCastFailure extends MoviesDetailsState {
  final ApiErrorModel apiErrorModel;

  GetMovieCastFailure(this.apiErrorModel);
}
