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
    if (result.success) {
      saveToCache(
          key: DataCacheKeys.nowPlayingMovies, value: result.moviesModel!);
      emit(GetNowPlayingMoviesSuccess());
    } else {
      emit(GetNowPlayingMoviesFailure());
    }
  }

  Future<void> getMostPopularMovies({int? page = 1}) async {
    emit(GetMostPopularMoviesLoading());
    final result = await moviesRepo.getMostPopularMovies(page: page!);
    if (result.success) {
      saveToCache(
          key: DataCacheKeys.mostPopularMovies, value: result.moviesModel!);
      emit(GetMostPopularMoviesSuccess());
    } else {
      emit(GetMostPopularMoviesFailure());
    }
  }

  Future<void> getTopRatedMovies({int? page = 1}) async {
    emit(GetTopRatedMoviesLoading());
    final result = await moviesRepo.getTopRatedMovies(page: page!);
    if (result.success) {
      saveToCache(
          key: DataCacheKeys.topRatedMovies, value: result.moviesModel!);
      emit(GetTopRatedMoviesSuccess());
    } else {
      emit(GetTopRatedMoviesFailure());
    }
  }

  Future<void> getUpcomingMovies({int? page = 1}) async {
    final result = await moviesRepo.getUpcomingMovies(page: page!);
    emit(GetUpcomingMoviesLoading());
    if (result.success) {
      saveToCache(
          key: DataCacheKeys.upcomingMovies, value: result.moviesModel!);
      emit(GetUpcomingMoviesSuccess());
    } else {
      emit(GetUpcomingMoviesFailure());
    }
  }

  Future<void> getMovies({bool wantToRefresh = false}) async {
    var nowPlayingMovies = localCache.getData(DataCacheKeys.nowPlayingMovies);
    if (wantToRefresh == false && nowPlayingMovies != null) {
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
