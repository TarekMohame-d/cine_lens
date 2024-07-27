import '../../../core/helpers/data_cache.dart';
import '../data/repos/movies_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo moviesRepo;
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());

  Future<void> getNowPlayingMovies() async {
    final result = await moviesRepo.getNowPlayingMovies();
    if (result.success) {
      cache.setData(DataCacheKeys.nowPlayingMovies, result.moviesModel);
    }
  }

  Future<void> getMostPopularMovies() async {
    final result = await moviesRepo.getMostPopularMovies();
    if (result.success) {
      cache.setData(DataCacheKeys.mostPopularMovies, result.moviesModel);
    }
  }

  Future<void> getTopRatedMovies() async {
    final result = await moviesRepo.getTopRatedMovies();
    if (result.success) {
      cache.setData(DataCacheKeys.topRatedMovies, result.moviesModel);
    }
  }

  Future<void> getUpcomingMovies() async {
    final result = await moviesRepo.getUpcomingMovies();
    if (result.success) {
      cache.setData(DataCacheKeys.upcomingMovies, result.moviesModel);
    }
  }

  Future<void> getMovies({bool wantToRefresh = false}) async {
    var nowPlayingMovies = cache.getData(DataCacheKeys.nowPlayingMovies);
    if (wantToRefresh == false && nowPlayingMovies != null) {
      emit(GetMoviesSuccess());
      return;
    }
    emit(GetMoviesLoading());
    await Future.wait([
      getNowPlayingMovies(),
      getMostPopularMovies(),
      getTopRatedMovies(),
      getUpcomingMovies(),
    ]);

    emit(GetMoviesSuccess());
  }
}
