part of 'movies_details_cubit.dart';

@immutable
sealed class MoviesDetailsState {}

final class MoviesDetailsInitial extends MoviesDetailsState {}

final class GetMovieDetailsAndCastLoading extends MoviesDetailsState {}

final class GetMovieDetailsAndCastSuccess extends MoviesDetailsState {}

final class GetMovieDetailsAndCastFailure extends MoviesDetailsState {}
