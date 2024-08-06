part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesSearch extends MoviesState {}

final class GetNowPlayingMoviesLoading extends MoviesState {}

final class GetNowPlayingMoviesSuccess extends MoviesState {}

final class GetNowPlayingMoviesFailure extends MoviesState {
  final ApiErrorModel errorModel;

  GetNowPlayingMoviesFailure(this.errorModel);
}

final class GetMostPopularMoviesLoading extends MoviesState {}

final class GetMostPopularMoviesSuccess extends MoviesState {}

final class GetMostPopularMoviesFailure extends MoviesState {
  final ApiErrorModel errorModel;

  GetMostPopularMoviesFailure(this.errorModel);
}

final class GetTopRatedMoviesLoading extends MoviesState {}

final class GetTopRatedMoviesSuccess extends MoviesState {}

final class GetTopRatedMoviesFailure extends MoviesState {
  final ApiErrorModel errorModel;

  GetTopRatedMoviesFailure(this.errorModel);
}

final class GetUpcomingMoviesLoading extends MoviesState {}

final class GetUpcomingMoviesSuccess extends MoviesState {}

final class GetUpcomingMoviesFailure extends MoviesState {
  final ApiErrorModel errorModel;

  GetUpcomingMoviesFailure(this.errorModel);
}

final class GetMoviesFromCache extends MoviesState {}
