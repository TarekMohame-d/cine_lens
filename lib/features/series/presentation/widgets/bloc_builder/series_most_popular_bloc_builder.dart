import 'package:cine_lens/core/enums/series_categories.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/presentation/cubit/series_cubit.dart';
import 'package:cine_lens/features/series/presentation/widgets/series_category_and_see_all.dart';
import 'package:cine_lens/features/series/presentation/widgets/series_list_view.dart';
import 'package:cine_lens/features/series/presentation/widgets/series_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeriesMostPopularBlocBuilder extends StatelessWidget {
  const SeriesMostPopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
   context.read<SeriesCubit>().getMostPopularSeries();
    return BlocBuilder<SeriesCubit, SeriesState>(
      buildWhen: (previous, current) =>
          current is GetMostPopularSeriesLoading ||
          current is GetMostPopularSeriesSuccess ||
          current is GetMostPopularSeriesFailure,
      builder: (context, state) {
        switch (state) {
          case GetMostPopularSeriesSuccess _:
            return _buildSuccess(state.seriesList);
          case GetMostPopularSeriesFailure _:
            return _buildFailure(state.errorModel.statusMessage!, context);
          default:
            return _buildLoading();
        }
      },
    );
  }

  Widget _widgetOutline(Widget child, List<SeriesEntity> series) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        spacing: 12.h,
        children: [
          SeriesCategoryAndSeeAll(
            category: SeriesCategories.mostPopular,
            series: series,
          ),
          SizedBox(height: 240.h, child: child),
        ],
      ),
    );
  }

  Widget _buildLoading() => _widgetOutline(SeriesShimmerLoading(), []);

  Widget _buildSuccess(List<SeriesEntity> series) => _widgetOutline(
        SeriesListView(series: series),
        series,
      );

  Widget _buildFailure(String message, BuildContext context) => _widgetOutline(
        Container(
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
}