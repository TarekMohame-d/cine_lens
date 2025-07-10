part of 'series_cubit.dart';

@immutable
sealed class SeriesState {}

final class SeriesInitial extends SeriesState {}

final class GetAiringTodaySeriesLoading extends SeriesState {}

final class GetAiringTodaySeriesSuccess extends SeriesState {
  final List<SeriesEntity> seriesList;
  GetAiringTodaySeriesSuccess(this.seriesList);
}

final class GetAiringTodaySeriesFailure extends SeriesState {
  final ApiErrorModel errorModel;
  GetAiringTodaySeriesFailure(this.errorModel);
}

final class GetOnTheAirSeriesLoading extends SeriesState {}

final class GetOnTheAirSeriesSuccess extends SeriesState {
  final List<SeriesEntity> seriesList;
  GetOnTheAirSeriesSuccess(this.seriesList);
}

final class GetOnTheAirSeriesFailure extends SeriesState {
  final ApiErrorModel errorModel;
  GetOnTheAirSeriesFailure(this.errorModel);
}

final class GetTopRatedSeriesLoading extends SeriesState {}

final class GetTopRatedSeriesSuccess extends SeriesState {
  final List<SeriesEntity> seriesList;
  GetTopRatedSeriesSuccess(this.seriesList);
}

final class GetTopRatedSeriesFailure extends SeriesState {
  final ApiErrorModel errorModel;
  GetTopRatedSeriesFailure(this.errorModel);
}

final class GetMostPopularSeriesLoading extends SeriesState {}

final class GetMostPopularSeriesSuccess extends SeriesState {
  final List<SeriesEntity> seriesList;
  GetMostPopularSeriesSuccess(this.seriesList);
}

final class GetMostPopularSeriesFailure extends SeriesState {
  final ApiErrorModel errorModel;
  GetMostPopularSeriesFailure(this.errorModel);
}

final class FetchMoreSeriesLoading extends SeriesState {}

final class FetchMoreSeries extends SeriesState {}
