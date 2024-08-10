import 'package:cine_rank/core/networking/api_error_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/data_cache.dart';
import '../../data/models/movies_model.dart';
import '../../data/repos/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo moviesRepo;
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());

  Future<void> getNowPlayingMovies({int? page = 1}) async {
    emit(GetNowPlayingMoviesLoading());
    final result = await moviesRepo.getNowPlayingMovies(page: page!);
    if (result.isSuccess) {
      saveToCache(key: DataCacheKeys.nowPlayingMovies, value: result.data!);
      emit(GetNowPlayingMoviesSuccess());
    } else {
      emit(GetNowPlayingMoviesFailure(result.error!));
    }
  }

  Future<void> getMostPopularMovies({int? page = 1}) async {
    emit(GetMostPopularMoviesLoading());
    final result = await moviesRepo.getMostPopularMovies(page: page!);
    if (result.isSuccess) {
      saveToCache(key: DataCacheKeys.mostPopularMovies, value: result.data!);
      emit(GetMostPopularMoviesSuccess());
    } else {
      emit(GetMostPopularMoviesFailure(result.error!));
    }
  }

  Future<void> getTopRatedMovies({int? page = 1}) async {
    emit(GetTopRatedMoviesLoading());
    final result = await moviesRepo.getTopRatedMovies(page: page!);
    if (result.isSuccess) {
      saveToCache(key: DataCacheKeys.topRatedMovies, value: result.data!);
      emit(GetTopRatedMoviesSuccess());
    } else {
      emit(GetTopRatedMoviesFailure(result.error!));
    }
  }

  Future<void> getUpcomingMovies({int? page = 1}) async {
    final result = await moviesRepo.getUpcomingMovies(page: page!);
    emit(GetUpcomingMoviesLoading());
    if (result.isSuccess) {
      saveToCache(key: DataCacheKeys.upcomingMovies, value: result.data!);
      emit(GetUpcomingMoviesSuccess());
    } else {
      emit(GetUpcomingMoviesFailure(result.error!));
    }
  }

  Future<void> getMovies({bool wantToRefresh = false}) async {
    if (wantToRefresh == false && allMovieDataExistsInCache()) {
      emit(GetMoviesFromCache());
      return;
    }

    int numberOfPages = 3;
    List<Future> futures = [];

    void addMovieFutures(Future<void> Function({int page}) getMoviesFunction) {
      for (int page = 1; page <= numberOfPages; page++) {
        futures.add(getMoviesFunction(page: page));
      }
    }

    addMovieFutures(getNowPlayingMovies);
    addMovieFutures(getMostPopularMovies);
    addMovieFutures(getTopRatedMovies);
    addMovieFutures(getUpcomingMovies);

    await Future.wait(futures);
  }

  bool allMovieDataExistsInCache() {
    var nowPlayingMovies = localCache.getData(DataCacheKeys.nowPlayingMovies);
    var mostPopularMovies = localCache.getData(DataCacheKeys.mostPopularMovies);
    var topRatedMovies = localCache.getData(DataCacheKeys.topRatedMovies);
    var upcomingMovies = localCache.getData(DataCacheKeys.upcomingMovies);

    return nowPlayingMovies != null &&
        mostPopularMovies != null &&
        topRatedMovies != null &&
        upcomingMovies != null;
  }

  void saveToCache({required String key, required MoviesModel value}) {
    MoviesModel? moviesData = localCache.getData(key);
    if (moviesData != null) {
      Set<Movie> set = moviesData.movies!.toSet();
      set.addAll(value.movies!);
      moviesData.movies = set.toList();
      localCache.setData(key, moviesData);
    } else {
      localCache.setData(key, value);
    }
  }
}
