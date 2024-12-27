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

  int _nowPlayingPage = 1;
  int _mostPopularPage = 1;
  int _upcomingPage = 1;
  int _topRatedPage = 1;

  MoviesRepoImpl() {
    _nowPlayingMoviesDataSource = NowPlayingMoviesDataSource();
    _mostPopularMoviesDataSource = MostPopularMoviesDataSource();
    _upcomingMoviesDataSource = UpcomingMoviesDataSource();
    _topRatedMoviesDataSource = TopRatedMoviesDataSource();
  }

  Future<ApiResult<List<MovieEntity>>> _fetchMovies({
    required int page,
    required List<MovieEntity> movieList,
    required Future<Map<String, dynamic>> Function(int) dataSourceFetcher,
    required VoidCallback updatePage,
    required bool more,
  }) async {
    try {
      if (movieList.isNotEmpty && !more) return ApiResult.success(movieList);
      final response = await dataSourceFetcher(page);
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      if (moviesModel.totalPages! >= page) {
        movieList.addAll(moviesModel.movies!
            .map((movie) => MoviesMapper.toEntity(movie))
            .where((movie) => !movieList
                .any((existingMovie) => existingMovie.id == movie.id)));
        updatePage();
      }
      return ApiResult.success(movieList);
    } catch (e) {
      debugPrint('Error while fetching movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getNowPlayingMovies(
      [bool more = false]) {
    return _fetchMovies(
      page: _nowPlayingPage,
      movieList: _nowPlayingMoviesList,
      dataSourceFetcher: _nowPlayingMoviesDataSource.getNowPlayingMovies,
      updatePage: () => _nowPlayingPage++,
      more: more,
    );
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getMostPopularMovies(
      [bool more = false]) {
    return _fetchMovies(
      page: _mostPopularPage,
      movieList: _mostPopularMoviesList,
      dataSourceFetcher: _mostPopularMoviesDataSource.getMostPopularMovies,
      updatePage: () => _mostPopularPage++,
      more: more,
    );
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getTopRatedMovies([bool more = false]) {
    return _fetchMovies(
      page: _topRatedPage,
      movieList: _topRatedMoviesList,
      dataSourceFetcher: _topRatedMoviesDataSource.getTopRatedMovies,
      updatePage: () => _topRatedPage++,
      more: more,
    );
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getUpcomingMovies([bool more = false]) {
    return _fetchMovies(
      page: _upcomingPage,
      movieList: _upcomingMoviesList,
      dataSourceFetcher: _upcomingMoviesDataSource.getUpcomingMovies,
      updatePage: () => _upcomingPage++,
      more: more,
    );
  }
}
