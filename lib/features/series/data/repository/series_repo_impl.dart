import 'package:cine_lens/core/networking/api_error_handler.dart';
import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/series/data/data_source/airing_today_series_data_source.dart';
import 'package:cine_lens/features/series/data/data_source/most_popular_series_data_source.dart';
import 'package:cine_lens/features/series/data/data_source/on_the_air_series_data_source.dart';
import 'package:cine_lens/features/series/data/data_source/top_rated_series_data_source.dart';
import 'package:cine_lens/features/series/data/mappers/series_mapper.dart';
import 'package:cine_lens/features/series/data/models/series_model.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/domain/repository/series_repo.dart';
import 'package:flutter/material.dart';

class SeriesRepoImpl implements SeriesRepo {
  late AiringTodaySeriesDataSource _airingTodaySeriesDataSource;
  late OnTheAirSeriesDataSource _onTheAirSeriesDataSource;
  late TopRatedSeriesDataSource _topRatedSeriesDataSource;
  late MostPopularSeriesDataSource _mostPopularSeriesDataSource;

  final List<SeriesEntity> _airingTodaySeriesList = [];
  final List<SeriesEntity> _onTheAirSeriesList = [];
  final List<SeriesEntity> _topRatedSeriesList = [];
  final List<SeriesEntity> _mostPopularSeriesList = [];

  int _airingTodayPage = 1;
  int _onTheAirPage = 1;
  int _topRatedPage = 1;
  int _mostPopularPage = 1;

  SeriesRepoImpl() {
    _airingTodaySeriesDataSource = AiringTodaySeriesDataSource();
    _onTheAirSeriesDataSource = OnTheAirSeriesDataSource();
    _topRatedSeriesDataSource = TopRatedSeriesDataSource();
    _mostPopularSeriesDataSource = MostPopularSeriesDataSource();
  }

  Future<ApiResult<List<SeriesEntity>>> _fetchSeries({
    required int page,
    required List<SeriesEntity> seriesList,
    required Future<Map<String, dynamic>> Function(int) dataSourceFetcher,
    required VoidCallback updatePage,
    required bool more,
  }) async {
    try {
      if (seriesList.isNotEmpty && !more) return ApiResult.success(seriesList);
      final response = await dataSourceFetcher(page);
      SeriesModel seriesModel = SeriesModel.fromJson(response);
      if (seriesModel.totalPages! >= page) {
        seriesList.addAll(seriesModel.series!
            .map((movie) => SeriesMapper.toEntity(movie))
            .where((movie) => !seriesList
                .any((existingMovie) => existingMovie.id == movie.id)));
        updatePage();
      }
      return ApiResult.success(_airingTodaySeriesList);
    } catch (e) {
      debugPrint('Error while fetching movies: ${e.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<SeriesEntity>>> getAiringTodaySeries(bool more) async {
    return _fetchSeries(
      page: _airingTodayPage,
      seriesList: _airingTodaySeriesList,
      dataSourceFetcher: _airingTodaySeriesDataSource.getAiringTodaySeries,
      updatePage: () => _airingTodayPage++,
      more: more,
    );
  }

  @override
  Future<ApiResult<List<SeriesEntity>>> getOnTheAirSeries(bool more) {
    return _fetchSeries(
      page: _onTheAirPage,
      seriesList: _onTheAirSeriesList,
      dataSourceFetcher: _onTheAirSeriesDataSource.getOnTheAirSeries,
      updatePage: () => _onTheAirPage++,
      more: more,
    );
  }

  @override
  Future<ApiResult<List<SeriesEntity>>> getTopRatedSeries(bool more) {
    return _fetchSeries(
      page: _topRatedPage,
      seriesList: _topRatedSeriesList,
      dataSourceFetcher: _topRatedSeriesDataSource.getTopRatedSeries,
      updatePage: () => _topRatedPage++,
      more: more,
    );
  }

  @override
  Future<ApiResult<List<SeriesEntity>>> getMostPopular(bool more) {
    return _fetchSeries(
      page: _mostPopularPage,
      seriesList: _mostPopularSeriesList,
      dataSourceFetcher: _mostPopularSeriesDataSource.getMostPopularSeries,
      updatePage: () => _mostPopularPage++,
      more: more,
    );
  }
}
