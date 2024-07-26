import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/features/movies/data/repos/movies_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo moviesRepo;
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());

  Future<void> getNowPlayingMovies() async {
    final result = await moviesRepo.getNowPlayingMovies();
    if (result.$2) {
      AppConstants.nowPlayingMovies = result.$1;
    }
  }

  Future<void> getMostPopularMovies() async {
    final result = await moviesRepo.getMostPopularMovies();
    if (result.$2) {
      AppConstants.mostPopularMovies = result.$1;
    }
  }

  Future<void> getTopRatedMovies() async {
    final result = await moviesRepo.getTopRatedMovies();
    if (result.$2) {
      AppConstants.topRatedMovies = result.$1;
    }
  }

  Future<void> getUpcomingMovies() async {
    final result = await moviesRepo.getUpcomingMovies();
    if (result.$2) {
      AppConstants.upcomingMovies = result.$1;
    }
  }

  Future<void> getMovies({bool wantToRefresh = false}) async {
    if (wantToRefresh == false && AppConstants.mostPopularMovies != null) {
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
