part of 'movies_search_cubit.dart';

@immutable
sealed class MoviesSearchState {}

final class MoviesSearchInitial extends MoviesSearchState {}

final class MoviesSearchLoading extends MoviesSearchState {}

final class MoviesSearchSuccess extends MoviesSearchState {
  final MoviesModel moviesModel;
  MoviesSearchSuccess(this.moviesModel);
}

final class MoviesSearchFailure extends MoviesSearchState {
  final ApiErrorModel errorModel;

  MoviesSearchFailure(this.errorModel);
}
