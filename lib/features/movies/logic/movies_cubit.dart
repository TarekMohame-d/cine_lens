import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/features/movies/data/repos/movies_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo moviesRepo;
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());

  String searchText = '';
  void searchMovies({required String query}) {
    searchText = query;
    emit(MoviesSearch());
  }

  Future<void> getNowPlayingMovies({bool wantToUpdate = false}) async {
    if (wantToUpdate == false && AppConstants.moviesModel != null) {
      emit(MoviesGetNowPlayingSuccess());
      return;
    }
    emit(MoviesGetNowPlayingLoading());
    final result = await moviesRepo.getNowPlayingMovies();
    if (result.$2) {
      AppConstants.moviesModel = result.$1;
      emit(MoviesGetNowPlayingSuccess());
    } else {
      emit(MoviesGetNowPlayingFailure());
    }
  }
}
