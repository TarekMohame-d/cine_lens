import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/data_cache.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/movies_model.dart';
import '../../../logic/movies_cubit/movies_cubit.dart';
import '../movies_lists_title_and_see_all.dart';
import 'custom_carousel_slider.dart';
import 'now_playing_shimmer_loading.dart';

class NowPlayingBlocBuilder extends StatelessWidget {
  const NowPlayingBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetNowPlayingMoviesLoading ||
          current is GetNowPlayingMoviesSuccess ||
          current is GetNowPlayingMoviesFailure ||
          current is GetMoviesFromCache,
      builder: (context, state) {
        if (state is GetNowPlayingMoviesLoading) {
          return setupLoading();
        } else if (state is GetNowPlayingMoviesSuccess ||
            state is GetMoviesFromCache) {
          return setupSuccess();
        } else {
          return setupError();
        }
      },
    );
  }

  Widget setupLoading() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Column(
        children: [
          const MoviesListsTitleAndSeeAll(
            title: 'Now Playing',
            movies: [],
          ),
          verticalSpace(12),
          const NowPlayingShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess() {
    MoviesModel nowPlayingMovies =
        localCache.getData(DataCacheKeys.nowPlayingMovies);
    return Column(
      children: [
        MoviesListsTitleAndSeeAll(
          title: 'Now Playing',
          movies: nowPlayingMovies.movies,
        ),
        verticalSpace(12),
        const CustomCarouselSlider(),
      ],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
