import '../../data/models/movie_cast_model.dart';
import '../../data/models/movie_details_model.dart';
import '../../data/models/movie_watch_providers_model.dart';
import '../../data/models/similar_movies_model.dart';
import '../../data/repos/movies_details_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(this.moviesRepo) : super(MoviesDetailsInitial());

  final MoviesDetailsRepo moviesRepo;

  MovieDetailsModel? movieDetails;
  CastModel? cast;
  SimilarMoviesModel? similarMoviesModel;
  MovieWatchProviderModel? movieWatchProviderModel;

  Future<bool> getMovieDetails({required int movieId}) async {
    final result = await moviesRepo.getMovieDetails(movieId: movieId);
    if (result.success) {
      movieDetails = result.movieDetails;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getMovieCastAndCrew({required int movieId}) async {
    final result = await moviesRepo.getMovieCastAndCrew(movieId: movieId);
    if (result.success) {
      cast = result.castModel;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getSimilarMovies({required int movieId}) async {
    final result = await moviesRepo.getSimilarMovies(movieId: movieId);
    if (result.success) {
      similarMoviesModel = result.similarMoviesModel;
      return true;
    } else {
      return false;
    }
  }

  Future<void> getMovieWatchProviders({required int movieId}) async {
    if (movieWatchProviderModel != null) return;
    final result = await moviesRepo.getMovieWatchProviders(movieId: movieId);
    if (result.success) {
      movieWatchProviderModel = result.movieWatchProviderModel;
    }
  }

  Future<void> getMovieDetailsAndCast({required int movieId}) async {
    emit(GetMovieDetailsAndCastLoading());
    final results = await Future.wait([
      getMovieDetails(movieId: movieId),
      getMovieCastAndCrew(movieId: movieId),
      getSimilarMovies(movieId: movieId),
    ]);
    if (results.every((result) => result)) {
      emit(GetMovieDetailsAndCastSuccess());
    } else {
      emit(GetMovieDetailsAndCastFailure());
    }
  }
}
