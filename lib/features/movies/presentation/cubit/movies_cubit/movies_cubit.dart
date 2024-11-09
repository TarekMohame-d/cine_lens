import 'package:cine_rank/core/networking/api_error_model.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_most_popular_movies_use_case.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_upcoming_movies_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;
  final GetMostPopularMoviesUseCase _getMostPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;
  MoviesCubit(
    this._getNowPlayingMoviesUseCase,
    this._getMostPopularMoviesUseCase,
    this._getTopRatedMoviesUseCase,
    this._getUpcomingMoviesUseCase,
  ) : super(MoviesInitial());

  Future<void> getNowPlayingMovies({int page = 1, bool refresh = false}) async {
    emit(GetNowPlayingMoviesLoading());
    final result = await _getNowPlayingMoviesUseCase.call(page, refresh);
    if (result.isSuccess) {
      emit(GetNowPlayingMoviesSuccess(result.data!));
    } else {
      emit(GetNowPlayingMoviesFailure(result.error!));
    }
  }

  Future<void> getMostPopularMovies(
      {int page = 1, bool refresh = false}) async {
    emit(GetMostPopularMoviesLoading());
    final result = await _getMostPopularMoviesUseCase.call(page, refresh);
    if (result.isSuccess) {
      emit(GetMostPopularMoviesSuccess(result.data!));
    } else {
      emit(GetMostPopularMoviesFailure(result.error!));
    }
  }

  Future<void> getTopRatedMovies({int page = 1, bool refresh = false}) async {
    emit(GetTopRatedMoviesLoading());
    final result = await _getTopRatedMoviesUseCase.call(page, refresh);
    if (result.isSuccess) {
      emit(GetTopRatedMoviesSuccess(result.data!));
    } else {
      emit(GetTopRatedMoviesFailure(result.error!));
    }
  }

  Future<void> getUpcomingMovies({int page = 1, bool refresh = false}) async {
    emit(GetUpcomingMoviesLoading());
    final result = await _getUpcomingMoviesUseCase.call(page, refresh);
    if (result.isSuccess) {
      emit(GetUpcomingMoviesSuccess(result.data!));
    } else {
      emit(GetUpcomingMoviesFailure(result.error!));
    }
  }

  Future<void> refreshData() async {
    await Future.wait([
      getNowPlayingMovies(refresh: true),
      getMostPopularMovies(refresh: true),
      getTopRatedMovies(refresh: true),
      getUpcomingMovies(refresh: true),
    ]);
  }
}
