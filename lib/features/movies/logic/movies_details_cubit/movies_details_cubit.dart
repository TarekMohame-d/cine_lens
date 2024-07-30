import 'package:cine_rank/features/movies/data/models/movie_cast_model.dart';
import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movies/data/repos/movies_details_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(this.moviesRepo) : super(MoviesDetailsInitial());

  final MoviesDetailsRepo moviesRepo;

  MovieDetailsModel? movieDetails;
  CastModel? cast;

  Future<bool> getMovieDetails({required int movieId}) async {
    emit(GetMovieDetailsLoading());
    final result = await moviesRepo.getMovieDetails(movieId: movieId);
    if (result.success) {
      movieDetails = result.movieDetails;
      emit(GetMovieDetailsSuccess());
      return true;
    } else {
      emit(GetMovieDetailsFailure());
      return false;
    }
  }

  Future<bool> getMovieCastAndCrew({required int movieId}) async {
    emit(GetMovieCastLoading());
    final result = await moviesRepo.getMovieCastAndCrew(movieId: movieId);
    if (result.success) {
      cast = result.castModel;
      emit(GetMovieCastSuccess());
      return true;
    } else {
      emit(GetMovieCastFailure());
      return false;
    }
  }

  Future<void> getMovieDetailsAndCast({required int movieId}) async {
    emit(GetMovieDetailsAndCastLoading());
    final results = await Future.wait([
      getMovieDetails(movieId: movieId),
      getMovieCastAndCrew(movieId: movieId),
    ]);
    if (results.every((result) => result)) {
      emit(GetMovieDetailsAndCastSuccess());
    } else {
      emit(GetMovieDetailsAndCastFailure());
    }
  }
}
