import 'package:cine_rank/core/enums/movies_categories.dart';
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

  Future<List<MovieEntity>> getNowPlayingMovies([bool more = false]) async {
    emit(GetNowPlayingMoviesLoading());
    final result = await _getNowPlayingMoviesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetNowPlayingMoviesSuccess(result.data!));
    } else {
      emit(GetNowPlayingMoviesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<List<MovieEntity>> getMostPopularMovies([bool more = false]) async {
    emit(GetMostPopularMoviesLoading());
    final result = await _getMostPopularMoviesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetMostPopularMoviesSuccess(result.data!));
      return result.data!;
    } else {
      emit(GetMostPopularMoviesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<List<MovieEntity>> getTopRatedMovies([bool more = false]) async {
    emit(GetTopRatedMoviesLoading());
    final result = await _getTopRatedMoviesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetTopRatedMoviesSuccess(result.data!));
    } else {
      emit(GetTopRatedMoviesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<List<MovieEntity>> getUpcomingMovies([bool more = false]) async {
    emit(GetUpcomingMoviesLoading());
    final result = await _getUpcomingMoviesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetUpcomingMoviesSuccess(result.data!));
    } else {
      emit(GetUpcomingMoviesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<void> getMoreMovies(
      MoviesCategoriesEnum category, bool more) async {
    List<MovieEntity> movies = [];
    switch (category) {
      case MoviesCategoriesEnum.nowPlaying:
        movies.addAll(await getNowPlayingMovies(more));
        break;
      case MoviesCategoriesEnum.mostPopular:
        movies.addAll(await getMostPopularMovies(more));
        break;
      case MoviesCategoriesEnum.topRated:
        movies.addAll(await getTopRatedMovies(more));
        break;
      case MoviesCategoriesEnum.upComing:
        movies.addAll(await getUpcomingMovies(more));
        break;
    }
    emit(FetchMoreMovies(movies));
  }
}
