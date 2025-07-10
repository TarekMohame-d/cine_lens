import 'package:cine_lens/core/helpers/spacing.dart';
import 'package:cine_lens/features/series/presentation/widgets/airing_today/airing_today_bloc_builder.dart';
import 'package:cine_lens/features/series/presentation/widgets/bloc_builder/on_the_air_bloc_builder.dart';
import 'package:cine_lens/features/series/presentation/widgets/bloc_builder/series_most_popular_bloc_builder.dart';
import 'package:cine_lens/features/series/presentation/widgets/bloc_builder/series_top_rated_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: AiringTodayBlocBuilder(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
            SliverToBoxAdapter(
              child: OnTheAirBlocBuilder(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
            SliverToBoxAdapter(
              child: SeriesMostPopularBlocBuilder(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
            SliverToBoxAdapter(
              child: SeriesTopRatedBlocBuilder(),
            ),
            SliverToBoxAdapter(
              child: verticalSpace(16),
            ),
          ],
        ),
      ),
    );
  }
}
