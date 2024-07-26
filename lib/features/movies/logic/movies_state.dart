part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesSearch extends MoviesState {}

final class GetMoviesLoading extends MoviesState {}

final class GetMoviesSuccess extends MoviesState {}

final class GetMoviesFailure extends MoviesState {}
