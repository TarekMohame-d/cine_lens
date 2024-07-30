// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Future<({MovieDetailsModel? movieDetails, bool success})> getMovieDetails(
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
      return (movieDetails: movieDetails, success: true);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return (movieDetails: null, success: false);
    }
  }

  Future<({CastModel? castModel, bool success})> getMovieCastAndCrew(
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
      return (castModel: castModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return (castModel: null, success: false);
    }
  }

  Future<({MovieVideoModel? movieVideoModel, bool success})> getMovieVideos(
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
      return (movieVideoModel: movieVideoModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return (movieVideoModel: null, success: false);
    }
  }

  Future<({MovieImagesModel? movieImagesModel, bool success})> getMovieImages(
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
      return (movieImagesModel: movieImagesModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return (movieImagesModel: null, success: false);
    }
  }

  Future<({SimilarMoviesModel? similarMoviesModel, bool success})>
      getSimilarMovies({required int movieId}) async {
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
      return (similarMoviesModel: similarMoviesModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return (similarMoviesModel: null, success: false);
    }
  }

  Future<({MovieWatchProviderModel? movieWatchProviderModel, bool success})>
      getMovieWatchProviders({required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId/similar';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
          'sort_by': 'vote_count.desc',
        },
      );
      MovieWatchProviderModel movieWatchProviderModel =
          MovieWatchProviderModel.fromJson(response);
      return (movieWatchProviderModel: movieWatchProviderModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return (movieWatchProviderModel: null, success: false);
    }
  }
}
