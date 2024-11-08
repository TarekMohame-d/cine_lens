import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/core/networking/api_services.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:flutter/material.dart';

class MoviesSearchRepo {
  final ApiService apiService;
  MoviesSearchRepo({required this.apiService});

  Future<ApiResult<MoviesModel>> getSearchMovies(
      {required String query, required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: KApiConstants.searchMoviesEndpoint,
        queryParameters: {
          'query': query,
          'page': page,
          'language': 'en-US',
          'sort_by': 'popularity.desc',
        },
      );
      MoviesModel searchMovies = MoviesModel.fromJson(response);
      return ApiResult.success(searchMovies);
    } catch (e) {
      debugPrint('Error while fetching search movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
