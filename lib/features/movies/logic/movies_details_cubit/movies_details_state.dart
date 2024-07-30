part of 'movies_details_cubit.dart';

@immutable
sealed class MoviesDetailsState {}

final class MoviesDetailsInitial extends MoviesDetailsState {}

final class GetMovieDetailsLoading extends MoviesDetailsState {}

final class GetMovieDetailsSuccess extends MoviesDetailsState {}

final class GetMovieDetailsFailure extends MoviesDetailsState {}

final class GetMovieCastLoading extends MoviesDetailsState {}

final class GetMovieCastSuccess extends MoviesDetailsState {}

final class GetMovieCastFailure extends MoviesDetailsState {}

final class GetMovieDetailsAndCastLoading extends MoviesDetailsState {}

final class GetMovieDetailsAndCastSuccess extends MoviesDetailsState {}

final class GetMovieDetailsAndCastFailure extends MoviesDetailsState {}
