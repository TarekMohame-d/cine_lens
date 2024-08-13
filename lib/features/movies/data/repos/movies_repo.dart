// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/core/networking/api_services.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoviesRepo {
  ApiService apiService;
  MoviesRepo({
    required this.apiService,
  });

  Future<ApiResult<MoviesModel>> getNowPlayingMovies(
      {required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesNowPlaying,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return ApiResult.success(moviesModel);
    } catch (e) {
      debugPrint('Error while fetching now playing movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MoviesModel>> getMostPopularMovies(
      {required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesMostPopular,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          // 'sort_by': 'popularity.desc',
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return ApiResult.success(moviesModel);
    } catch (e) {
      debugPrint('Error while fetching most popular movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MoviesModel>> getTopRatedMovies({required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesTopRated,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return ApiResult.success(moviesModel);
    } catch (e) {
      debugPrint('Error while fetching top rated movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MoviesModel>> getUpcomingMovies({required int page}) async {
    try {
      final dates = getDate();
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesUpcoming,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'year': dates.$3,
          'release_date.gte': dates.$2,
          'release_date.lte': dates.$1,
          //'sort_by': 'popularity.desc',
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return ApiResult.success(moviesModel);
    } catch (e) {
      debugPrint('Error while fetching upcoming movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  (String formattedOneMonthBefore, String formattedOneMonthAfter, int year)
      getDate() {
    // Current date
    DateTime currentDate = DateTime.now();

    // One month before
    DateTime oneMonthBefore =
        DateTime(currentDate.year, currentDate.month - 1, currentDate.day);

    // One month after
    DateTime oneMonthAfter =
        DateTime(currentDate.year, currentDate.month + 1, currentDate.day);

    int year = currentDate.year;

    String formattedOneMonthBefore =
        DateFormat('yyyy-MM-dd').format(oneMonthBefore);
    String formattedOneMonthAfter =
        DateFormat('yyyy-MM-dd').format(oneMonthAfter);
    return (
      formattedOneMonthBefore = formattedOneMonthBefore,
      formattedOneMonthAfter = formattedOneMonthAfter,
      year = year
    );
  }
}
