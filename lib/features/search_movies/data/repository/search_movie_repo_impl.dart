import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/data/mappers/movies_mapper.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/search_movies/data/data_sources/search_movies_data_source.dart';
import 'package:cine_rank/features/search_movies/domain/repository/search_movie_repo.dart';
import 'package:flutter/material.dart';

class SearchMovieRepoImpl implements SearchMovieRepo {
  late SearchMoviesDataSource _searchMoviesDataSource;
  SearchMovieRepoImpl() {
    _searchMoviesDataSource = SearchMoviesDataSource();
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getSearchMovies(String query) async {
    try {
      List<MovieEntity> searchMoviesList = [];
      final response = await _searchMoviesDataSource.getSearchMovies(query);
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      for (var movie in moviesModel.movies!) {
        searchMoviesList.add(MoviesMapper.mapToEntity(movie));
      }
      return ApiResult.success(searchMoviesList);
    } catch (e) {
      debugPrint('Error while fetching search movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
