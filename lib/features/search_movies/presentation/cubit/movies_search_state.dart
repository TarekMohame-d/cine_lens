part of 'movies_search_cubit.dart';

@immutable
sealed class MoviesSearchState {}

final class MoviesSearchInitial extends MoviesSearchState {}

final class MoviesSearchLoading extends MoviesSearchState {}

final class MoviesSearchSuccess extends MoviesSearchState {
  final List<MovieEntity> searchMovies;
  MoviesSearchSuccess(this.searchMovies);
}

final class MoviesSearchFailure extends MoviesSearchState {
  final ApiErrorModel errorModel;

  MoviesSearchFailure(this.errorModel);
}
