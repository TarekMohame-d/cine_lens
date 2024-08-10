import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/features/movies/data/models/movie_videos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/movie_cast_model.dart';
import '../../data/models/movie_details_model.dart';
import '../../data/models/movie_watch_providers_model.dart';
import '../../data/models/similar_movies_model.dart';
import '../../data/repos/movies_details_repo.dart';

part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(this.moviesRepo) : super(MoviesDetailsInitial());

  final MoviesDetailsRepo moviesRepo;

  MovieDetailsModel? movieDetails;
  CastModel? cast;
  SimilarMoviesModel? similarMoviesModel;
  MovieWatchProviderModel? movieWatchProviderModel;
  MovieVideoModel? movieVideoModel;

  Future<bool> getMovieDetails({required int movieId}) async {
    final result = await moviesRepo.getMovieDetails(movieId: movieId);
    if (result.isSuccess) {
      movieDetails = result.data;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getMovieCastAndCrew({required int movieId}) async {
    final result = await moviesRepo.getMovieCastAndCrew(movieId: movieId);
    if (result.isSuccess) {
      cast = result.data;
      return true;
    } else {
      return false;
    }
  }

  VideoData? videoData;

  Future<void> getMovieVideos({required int movieId}) async {
    if (videoData != null) return;

    final result = await moviesRepo.getMovieVideos(movieId: movieId);
    if (result.isSuccess) {
      movieVideoModel = result.data;
      var trailers = <VideoData>[];

      for (var video in movieVideoModel!.videoData!) {
        if (video.type == 'Trailer' && video.site == 'YouTube') {
          trailers.add(video);
        }
      }

      // Sort trailers by 'published_at' date from earliest to latest
      if (!trailers.isNullOrEmpty()) {
        trailers.sort((a, b) {
          final dateA = DateTime.parse(a.publishedAt!);
          final dateB = DateTime.parse(b.publishedAt!);
          return dateA.compareTo(dateB);
        });
      }

      // Select the first trailer if available
      if (trailers.isNotEmpty) {
        videoData = trailers.first;
      }
    }
  }

  Future<bool> getSimilarMovies({required int movieId}) async {
    final result = await moviesRepo.getSimilarMovies(movieId: movieId);
    if (result.isSuccess) {
      similarMoviesModel = result.data;
      return true;
    } else {
      return false;
    }
  }

  List<(WatchProvider, String)> watchProviders = [];
  Future<void> getMovieWatchProviders({required int movieId}) async {
    if (movieWatchProviderModel != null) return;
    final result = await moviesRepo.getMovieWatchProviders(movieId: movieId);
    if (result.isSuccess) {
      movieWatchProviderModel = result.data;
      watchProviders =
          result.data!.country!.toWatchProviderList();
    }
  }

  Future<void> getMovieDetailsAndCast({required int movieId}) async {
    emit(GetMovieDetailsAndCastLoading());
    final results = await Future.wait([
      getMovieDetails(movieId: movieId),
      getMovieCastAndCrew(movieId: movieId),
      getSimilarMovies(movieId: movieId),
    ]);
    if (results.every((result) => result)) {
      emit(GetMovieDetailsAndCastSuccess());
    } else {
      emit(GetMovieDetailsAndCastFailure());
    }
  }
}
