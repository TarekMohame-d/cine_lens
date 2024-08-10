import 'package:cine_rank/core/networking/api_error_model.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/data/repos/movies_search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_search_state.dart';

class MoviesSearchCubit extends Cubit<MoviesSearchState> {
  MoviesSearchCubit(this.moviesSearchRepo) : super(MoviesSearchInitial());
  final MoviesSearchRepo moviesSearchRepo;

  Future<void> getSearchMovies({required String query, required int page}) async {
    emit(MoviesSearchLoading());
    final result = await moviesSearchRepo.getSearchMovies(query: query, page: page);
    if (result.isSuccess) {
      emit(MoviesSearchSuccess(result.data!));
    } else {
      emit(MoviesSearchFailure(result.error!));
    }
  }
}
