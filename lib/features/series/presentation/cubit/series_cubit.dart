import 'package:cine_lens/core/enums/series_categories.dart';
import 'package:cine_lens/core/networking/api_error_model.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/domain/usecases/get_airing_today_series_use_case.dart';
import 'package:cine_lens/features/series/domain/usecases/get_most_popular_series_use_case.dart';
import 'package:cine_lens/features/series/domain/usecases/get_on_the_air_series_use_case.dart';
import 'package:cine_lens/features/series/domain/usecases/get_top_rated_series_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  SeriesCubit(
    this._getAiringTodaySeriesUseCase,
    this._getMostPopularSeriesUseCase,
    this._getTopRatedSeriesUseCase,
    this._getOnTheAirSeriesUseCase,
  ) : super(SeriesInitial());

  final GetAiringTodaySeriesUseCase _getAiringTodaySeriesUseCase;
  final GetMostPopularSeriesUseCase _getMostPopularSeriesUseCase;
  final GetTopRatedSeriesUseCase _getTopRatedSeriesUseCase;
  final GetOnTheAirSeriesUseCase _getOnTheAirSeriesUseCase;

  Future<List<SeriesEntity>> getAiringTodaySeries([bool more = false]) async {
    emit(GetAiringTodaySeriesLoading());
    final result = await _getAiringTodaySeriesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetAiringTodaySeriesSuccess(result.data!));
    } else {
      emit(GetAiringTodaySeriesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<List<SeriesEntity>> getMostPopularSeries([bool more = false]) async {
    emit(GetMostPopularSeriesLoading());
    final result = await _getMostPopularSeriesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetMostPopularSeriesSuccess(result.data!));
    } else {
      emit(GetMostPopularSeriesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<List<SeriesEntity>> getTopRatedSeries([bool more = false]) async {
    emit(GetTopRatedSeriesLoading());
    final result = await _getTopRatedSeriesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetTopRatedSeriesSuccess(result.data!));
    } else {
      emit(GetTopRatedSeriesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<List<SeriesEntity>> getOnTheAirSeries([bool more = false]) async {
    emit(GetOnTheAirSeriesLoading());
    final result = await _getOnTheAirSeriesUseCase.call(more);
    if (result.isSuccess) {
      emit(GetOnTheAirSeriesSuccess(result.data!));
    } else {
      emit(GetOnTheAirSeriesFailure(result.error!));
    }
    return result.data ?? [];
  }

  Future<List<SeriesEntity>> getMoreSeries(SeriesCategories category) async {
    emit(FetchMoreSeriesLoading());
    List<SeriesEntity> series = [];
    switch (category) {
      case SeriesCategories.airingToday:
        series.addAll(await getAiringTodaySeries(true));
        break;
      case SeriesCategories.onTheAir:
        series.addAll(await getOnTheAirSeries(true));
        break;
      case SeriesCategories.mostPopular:
        series.addAll(await getMostPopularSeries(true));
        break;
      case SeriesCategories.topRated:
        series.addAll(await getTopRatedSeries(true));
        break;
    }
    emit(FetchMoreSeries());
    return series;
  }
}
