// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:cine_rank/core/networking/api_services.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:flutter/material.dart';

class MoviesRepo {
  ApiService apiService;
  MoviesRepo({
    required this.apiService,
  });

  Future<(MoviesModel? moviesModel, bool success)> getNowPlayingMovies() async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesNowPlaying,
        queryParameters: {
          'language': 'en-US',
          'page': 1,
          'sort_by': 'popularity.desc',
          'release_date.gte': '{min_date}',
          'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel, true);
    } catch (e) {
      debugPrint('Error while fetching now playing movies: ${e.toString()}');
      return (null, false);
    }
  }

  Future<(MoviesModel? moviesModel, bool success)> getMostPopularMovies() async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesMostPopular,
        queryParameters: {
          'language': 'en-US',
          'page': 1,
          'sort_by': 'popularity.desc',
          'release_date.gte': '{min_date}',
          'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel, true);
    } catch (e) {
      debugPrint('Error while fetching most popular movies: ${e.toString()}');
      return (null, false);
    }
  }

  Future<(MoviesModel? moviesModel, bool success)> getTopRatedMovies() async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesTopRated,
        queryParameters: {
          'language': 'en-US',
          'page': 1,
          'sort_by': 'popularity.desc',
          'release_date.gte': '{min_date}',
          'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel, true);
    } catch (e) {
      debugPrint('Error while fetching top rated movies: ${e.toString()}');
      return (null, false);
    }
  }

  Future<(MoviesModel? moviesModel, bool success)> getUpcomingMovies() async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesUpcoming,
        queryParameters: {
          'language': 'en-US',
          'page': 1,
          'sort_by': 'popularity.desc',
          'release_date.gte': '{min_date}',
          'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel, true);
    } catch (e) {
      debugPrint('Error while fetching upcoming movies: ${e.toString()}');
      return (null, false);
    }
  }
}
