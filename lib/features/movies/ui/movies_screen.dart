import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/top_rated_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/up_comming_movies_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/themes/app_colors.dart';
import '../logic/movies_cubit/movies_cubit.dart';
import 'widgets/general/most_popular_movies_bloc_builder.dart';
import 'widgets/now_playing/now_playing_bloc_builder.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<MoviesCubit>().getMovies(wantToRefresh: true);
      },
      color: AppColors.blueAccent,
      backgroundColor: AppColors.soft,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.dark,
            actions: [
              IconButton(
                iconSize: 28.0.r,
                onPressed: () {
                  context.pushNamed(Routes.moviesSearchScreen);
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: NowPlayingBlocBuilder(),
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
            child: TopRatedMoviesBlocBuilder(),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(16),
          ),
          const SliverToBoxAdapter(
            child: UpCommingMoviesBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
