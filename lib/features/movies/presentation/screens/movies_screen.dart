import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movies/presentation/widgets/bloc_builder/most_popular_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/presentation/widgets/bloc_builder/top_rated_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/presentation/widgets/bloc_builder/up_comming_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/presentation/widgets/now_playing/now_playing_movies_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: const Text(
              'CineLens',
            ),
            titleSpacing: 0,
            titleTextStyle: Theme.of(context).textTheme.headlineLarge,
            backgroundColor: KColors.dark,
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
          SliverToBoxAdapter(
            child: verticalSpace(16),
          ),
        ],
      ),
    );
  }
}
