import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/movie_details/data/data_sources/movie_cast_data_source.dart';
import 'package:cine_rank/features/movie_details/data/data_sources/movie_details_data_source.dart';
import 'package:cine_rank/features/movie_details/data/data_sources/movie_videos_data_source.dart';
import 'package:cine_rank/features/movie_details/data/data_sources/movie_watch_providers_data_source.dart';
import 'package:cine_rank/features/movie_details/data/mapper/movie_cast_mapper.dart';
import 'package:cine_rank/features/movie_details/data/mapper/movie_details_mapper.dart';
import 'package:cine_rank/features/movie_details/data/mapper/movie_videos_mapper.dart';
import 'package:cine_rank/features/movie_details/data/mapper/movie_watch_providers_mapper.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_videos_model.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_watch_providers_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_videos_entity.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_watch_providers_entity.dart';
import 'package:cine_rank/features/movie_details/domain/repository/movie_details_repo.dart';
import 'package:flutter/material.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  late MovieDetailsDataSource _getMovieDetailsDataSource;
  late MovieVideosDataSource _getMovieVideosDataSource;
  late MovieWatchProvidersDataSource _getMovieWatchProvidersDataSource;
  late MovieCastDataSource _getMovieCastDataSource;

  MovieDetailsEntity? movieDetailsEntity;
  List<MovieVideosEntity> videos = [];
  MovieWatchProvidersEntity? movieWatchProvidersEntity;
  MovieCastEntity? movieCastEntity;
  int? movieId;
  int? movieVideoId;
  int? movieWatchProvidersId;
  int? movieCastId;

  MovieDetailsRepoImpl() {
    _getMovieDetailsDataSource = MovieDetailsDataSource();
    _getMovieVideosDataSource = MovieVideosDataSource();
    _getMovieWatchProvidersDataSource = MovieWatchProvidersDataSource();
    _getMovieCastDataSource = MovieCastDataSource();
  }
  @override
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId) async {
    try {
      if (this.movieId.isNullOrZero()) this.movieId = movieId;
      if (this.movieId == movieId && movieDetailsEntity != null) {
        return ApiResult.success(movieDetailsEntity!);
      }
      final response =
          await _getMovieDetailsDataSource.getMovieDetails(movieId);
      MovieDetailsModel movieDetails = MovieDetailsModel.fromJson(response);
      movieDetailsEntity = MovieDetailsMapper.toEntity(movieDetails);
      this.movieId = movieId;
      return ApiResult.success(movieDetailsEntity);
    } catch (e) {
      debugPrint('Error while fetching movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<MovieVideosEntity>>> getMovieVideos(int movieId) async {
    try {
      if (movieVideoId.isNullOrZero()) movieVideoId = movieId;
      if (movieVideoId == movieId && !videos.isNullOrEmpty()) {
        return ApiResult.success(videos);
      }
      videos.clear();
      final response = await _getMovieVideosDataSource.getMovieVideos(movieId);
      MovieVideoModel movieVideos = MovieVideoModel.fromJson(response);
      for (var video in movieVideos.videoData!) {
        videos.add(MovieVideosMapper.toEntity(video));
      }
      movieVideoId = movieId;
      return ApiResult.success(videos);
    } catch (e) {
      debugPrint('Error while fetching movies videos: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<MovieWatchProvidersEntity>> getMovieWatchProviders(
      int movieId) async {
    try {
      if (movieWatchProvidersId.isNullOrZero()) movieWatchProvidersId = movieId;
      if (movieWatchProvidersId == movieId &&
          movieWatchProvidersEntity != null) {
        return ApiResult.success(movieWatchProvidersEntity);
      }
      final response = await _getMovieWatchProvidersDataSource
          .getMovieWatchProviders(movieId);
      MovieWatchProvidersModel watchModel =
          MovieWatchProvidersModel.fromJson(response);
      movieWatchProvidersEntity =
          MovieWatchProvidersMapper.toEntity(watchModel);
      movieWatchProvidersId = movieId;
      return ApiResult.success(movieWatchProvidersEntity);
    } catch (e) {
      debugPrint(
          'Error while fetching movies watch providers: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<MovieCastEntity>> getMovieCastAndCrew(int movieId) async {
    try {
      if (movieCastId.isNullOrZero()) movieCastId = movieId;
      if (movieCastId == movieId && movieCastEntity != null) {
        return ApiResult.success(movieCastEntity);
      }
      final response =
          await _getMovieCastDataSource.getMovieCastAndCrew(movieId);
      CastModel castModel = CastModel.fromJson(response);
      movieCastEntity = MovieCastMapper.toEntity(castModel);
      movieCastId = movieId;
      return ApiResult.success(movieCastEntity);
    } catch (e) {
      debugPrint('Error while fetching movies Cast and Crew: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
