import 'package:cine_rank/core/networking/api_error_model.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/search_movies/domain/usecases/search_movie_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_search_state.dart';

class MoviesSearchCubit extends Cubit<MoviesSearchState> {
  MoviesSearchCubit(this._searchMovieUseCase) : super(MoviesSearchInitial());
  final SearchMovieUseCase _searchMovieUseCase;

  Future<void> getSearchMovies(String query) async {
    if (query.isEmpty) return;
    emit(MoviesSearchLoading());
    final result = await _searchMovieUseCase.call(query);
    if (result.isSuccess) {
      emit(MoviesSearchSuccess(result.data!));
    } else {
      emit(MoviesSearchFailure(result.error!));
    }
  }
}
