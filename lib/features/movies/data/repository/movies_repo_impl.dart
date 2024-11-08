// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movies/data/data_source/most_popular_movies_data_source.dart';
import 'package:cine_rank/features/movies/data/data_source/now_playing_movies_data_source.dart';
import 'package:cine_rank/features/movies/data/data_source/top_rated_movies_data_source.dart';
import 'package:cine_rank/features/movies/data/data_source/upcoming_movies_data_source.dart';
import 'package:cine_rank/features/movies/data/mappers/movies_mapper.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/domain/repository/movies_repo.dart';
import 'package:flutter/material.dart';

class MoviesRepoImpl implements MoviesRepo {
  late NowPlayingMoviesDataSource _nowPlayingMoviesDataSource;
  late MostPopularMoviesDataSource _mostPopularMoviesDataSource;
  late UpcomingMoviesDataSource _upcomingMoviesDataSource;
  late TopRatedMoviesDataSource _topRatedMoviesDataSource;

  final List<MovieEntity> _nowPlayingMoviesList = [];
  final List<MovieEntity> _mostPopularMoviesList = [];
  final List<MovieEntity> _upcomingMoviesList = [];
  final List<MovieEntity> _topRatedMoviesList = [];

  MoviesRepoImpl() {
    _nowPlayingMoviesDataSource = NowPlayingMoviesDataSource();
    _mostPopularMoviesDataSource = MostPopularMoviesDataSource();
    _upcomingMoviesDataSource = UpcomingMoviesDataSource();
    _topRatedMoviesDataSource = TopRatedMoviesDataSource();
  }

  Future<ApiResult<List<MovieEntity>>> _fetchMovies({
    required int page,
    required bool refresh,
    required List<MovieEntity> movieList,
    required Future<Map<String, dynamic>> Function(int) dataSourceFetcher,
  }) async {
    try {
      if (movieList.isNotEmpty && !refresh) {
        return ApiResult.success(movieList);
      }
      movieList.clear();
      final response = await dataSourceFetcher(page);
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      movieList.addAll(moviesModel.movies!.map(MoviesMapper.mapToEntity));
      return ApiResult.success(movieList);
    } catch (e) {
      debugPrint('Error while fetching movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getNowPlayingMovies(int page,
      [bool refresh = false]) {
    return _fetchMovies(
      page: page,
      refresh: refresh,
      movieList: _nowPlayingMoviesList,
      dataSourceFetcher: _nowPlayingMoviesDataSource.getNowPlayingMovies,
    );
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getMostPopularMovies(int page,
      [bool refresh = false]) {
    return _fetchMovies(
      page: page,
      refresh: refresh,
      movieList: _mostPopularMoviesList,
      dataSourceFetcher: _mostPopularMoviesDataSource.getMostPopularMovies,
    );
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies(int page,
      [bool refresh = false]) {
    return _fetchMovies(
      page: page,
      refresh: refresh,
      movieList: _topRatedMoviesList,
      dataSourceFetcher: _topRatedMoviesDataSource.getTopRatedMovies,
    );
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getUpcomingMovies(int page,
      [bool refresh = false]) {
    return _fetchMovies(
      page: page,
      refresh: refresh,
      movieList: _upcomingMoviesList,
      dataSourceFetcher: _upcomingMoviesDataSource.getUpcomingMovies,
    );
  }
}
