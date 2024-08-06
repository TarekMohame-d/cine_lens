import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
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
        switch (state) {
          case GetNowPlayingMoviesLoading _:
            return setupLoading();
          case GetNowPlayingMoviesSuccess _:
          case GetMoviesFromCache _:
            return setupSuccess();
          case GetNowPlayingMoviesFailure _:
            return setupError(
                state.errorModel.statusMessage ?? 'Unknown error',
                MediaQuery.of(context).size.width);
          default:
            return const SizedBox.shrink();
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

  Widget setupError(String errorMessage, double screenWidth) {
    return Column(
      children: [
        const MoviesListsTitleAndSeeAll(
          title: 'Now Playing',
        ),
        verticalSpace(12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Container(
            height: 230.0.h,
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.soft,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorMessage,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font16WhiteSemiBold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
