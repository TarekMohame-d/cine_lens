import 'package:cine_rank/core/networking/api_error_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cine_rank/features/movie_details/domain/usecases/get_movie_cast_use_case.dart';
import 'package:cine_rank/features/movie_details/domain/usecases/get_movie_details_use_case.dart';
import 'package:cine_rank/features/movie_details/domain/usecases/get_movie_video_use_case.dart';
import 'package:cine_rank/features/movie_details/domain/usecases/get_movie_watch_providers_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(
    this._getMoviesDetailsUseCase,
    this._getMovieVideosUseCase,
    this._getMovieWatchProvidersUseCase,
    this._getMovieCastUseCase,
  ) : super(MoviesDetailsInitial());

  final GetMovieDetailsUseCase _getMoviesDetailsUseCase;
  final GetMovieVideoUseCase _getMovieVideosUseCase;
  final GetMovieWatchProvidersUseCase _getMovieWatchProvidersUseCase;
  final GetMovieCastUseCase _getMovieCastUseCase;

  Future<void> getMovieDetails(int movieId) async {
    final result = await _getMoviesDetailsUseCase.call(movieId);
    if (result.isSuccess) {
      emit(GetMovieDetailsSuccess(result.data!));
    } else {
      emit(GetMovieDetailsFailure(result.error!));
    }
  }

  // Future<bool> getMovieCastAndCrew({required int movieId}) async {
  //   final result = await moviesRepo.getMovieCastAndCrew(movieId: movieId);
  //   if (result.isSuccess) {
  //     cast = result.data;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<void> getMovieVideos(int movieId) async {
    emit(GetMovieVideosLoading());
    final result = await _getMovieVideosUseCase.call(movieId);
    if (result.isSuccess) {
      emit(GetMovieVideosSuccess(result.data!));
    } else {
      emit(GetMovieVideosFailure(result.error!));
    }
  }

  // Future<bool> getSimilarMovies({required int movieId}) async {
  //   final result = await moviesRepo.getSimilarMovies(movieId: movieId);
  //   if (result.isSuccess) {
  //     similarMoviesModel = result.data;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<String> getMovieWatchProviders(int movieId) async {
    final result = await _getMovieWatchProvidersUseCase.call(movieId);
    return result.data!;
  }

  Future<void> getMovieCast(int movieId) async {
    emit(GetMovieCastLoading());
    final result = await _getMovieCastUseCase.call(movieId);
    if (result.isSuccess) {
      emit(GetMovieCastSuccess(result.data!));
    } else {
      emit(GetMovieCastFailure(result.error!));
    }
  }
}
