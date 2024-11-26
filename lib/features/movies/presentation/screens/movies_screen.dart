import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movies/presentation/widgets/most_popular_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/presentation/widgets/now_playing/now_playing_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/presentation/widgets/top_rated_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/presentation/widgets/up_comming_movies_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: KColors.dark,
          title: Image.asset(
            KConstants.appBranding,
            width: 130.w,
          ),
          titleSpacing: 6.w,
          actions: [
            IconButton(
              iconSize: 28.0.r,
              onPressed: () {
                context.pushNamed(KRoutes.moviesSearchScreen);
              },
              icon: const Icon(
                Icons.search_outlined,
                color: KColors.white,
              ),
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: NowPlayingMoviesBlocBuilder(),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(16),
        ),
        const SliverToBoxAdapter(
          child: MostPopularMoviesBlocBuilder(),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(16),
        ),
        const SliverToBoxAdapter(
          child: UpCommingMoviesBlocBuilder(),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(16),
        ),
        const SliverToBoxAdapter(
          child: TopRatedMoviesBlocBuilder(),
        ),
      ],
    );
  }
}
