part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesSearch extends MoviesState {}

final class MoviesGetNowPlayingLoading extends MoviesState {}

final class MoviesGetNowPlayingSuccess extends MoviesState {}

final class MoviesGetNowPlayingFailure extends MoviesState {}
