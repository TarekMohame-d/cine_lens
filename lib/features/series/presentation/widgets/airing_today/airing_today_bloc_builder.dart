import 'package:cine_lens/core/enums/series_categories.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/presentation/cubit/series_cubit.dart';
import 'package:cine_lens/features/series/presentation/widgets/airing_today/airing_carousel_slider.dart';
import 'package:cine_lens/features/series/presentation/widgets/airing_today/airing_today_shimmer.dart';
import 'package:cine_lens/features/series/presentation/widgets/series_category_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiringTodayBlocBuilder extends StatelessWidget {
  const AiringTodayBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SeriesCubit>().getAiringTodaySeries();
    return BlocBuilder<SeriesCubit, SeriesState>(
      buildWhen: (previous, current) =>
          current is GetAiringTodaySeriesLoading ||
          current is GetAiringTodaySeriesSuccess ||
          current is GetAiringTodaySeriesFailure,
      builder: (context, state) {
        switch (state) {
          case GetAiringTodaySeriesSuccess _:
            return _buildSuccess(state.seriesList);
          case GetAiringTodaySeriesFailure _:
            return _buildFailure(state.errorModel.statusMessage!, context);
          default:
            return _buildLoading();
        }
      },
    );
  }

  Widget _widgetOutline(Widget child, List<SeriesEntity> series) {
    return Column(
      spacing: 12.h,
      children: [
        SeriesCategoryAndSeeAll(
          category: SeriesCategories.airingToday,
          series: series,
        ),
        child,
      ],
    );
  }

  Widget _buildFailure(String message, BuildContext context) => _widgetOutline(
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          color: KColors.soft,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                message,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
        [],
      );

  Widget _buildSuccess(List<SeriesEntity> series) => _widgetOutline(
        RepaintBoundary(
          child: AiringCarouselSlider(series: series),
        ),
        series,
      );

  Widget _buildLoading() => _widgetOutline(
        AiringTodayShimmer(),
        [],
      );
}
