// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/core/networking/api_services.dart';
import 'package:cine_rank/features/movies/data/models/movie_cast_model.dart';
import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movies/data/models/movie_images_model.dart';
import 'package:cine_rank/features/movies/data/models/movie_videos_model.dart';
import 'package:cine_rank/features/movies/data/models/movie_watch_providers_model.dart';
import 'package:cine_rank/features/movies/data/models/similar_movies_model.dart';
import 'package:flutter/material.dart';

class MoviesDetailsRepo {
  ApiService apiService;
  MoviesDetailsRepo({
    required this.apiService,
  });

  Future<ApiResult<MovieDetailsModel>> getMovieDetails(
      {required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
        },
      );
      MovieDetailsModel movieDetails = MovieDetailsModel.fromJson(response);
      return ApiResult.success(movieDetails);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CastModel>> getMovieCastAndCrew(
      {required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId/credits';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
          'sort_by': 'popularity.desc',
        },
      );
      CastModel castModel = CastModel.fromJson(response);
      return ApiResult.success(castModel);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MovieVideoModel>> getMovieVideos(
      {required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId/videos';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
        },
      );
      MovieVideoModel movieVideoModel = MovieVideoModel.fromJson(response);
      return ApiResult.success(movieVideoModel);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MovieImagesModel>> getMovieImages(
      {required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId/images';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
          'sort_by': 'vote_count.desc',
        },
      );
      MovieImagesModel movieImagesModel = MovieImagesModel.fromJson(response);
      return ApiResult.success(movieImagesModel);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<SimilarMoviesModel>> getSimilarMovies(
      {required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId/similar';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
          'sort_by': 'vote_count.desc',
        },
      );
      SimilarMoviesModel similarMoviesModel =
          SimilarMoviesModel.fromJson(response);
      return ApiResult.success(similarMoviesModel);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<MovieWatchProviderModel>> getMovieWatchProviders(
      {required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId/watch/providers';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
          'sort_by': 'vote_count.desc',
        },
      );
      MovieWatchProviderModel movieWatchProviderModel =
          MovieWatchProviderModel.fromJson(response);
      return ApiResult.success(movieWatchProviderModel);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
