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
import 'general_movies_list_view.dart';
import 'general_movies_shimmer_loading.dart';

class MostPopularMoviesBlocBuilder extends StatelessWidget {
  const MostPopularMoviesBlocBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetMostPopularMoviesLoading ||
          current is GetMostPopularMoviesSuccess ||
          current is GetMostPopularMoviesFailure ||
          current is GetMoviesFromCache,
      builder: (context, state) {
        switch (state) {
          case GetMostPopularMoviesLoading _:
            return setupLoading();
          case GetMostPopularMoviesSuccess _:
          case GetMoviesFromCache _:
            return setupSuccess();
          case GetMostPopularMoviesFailure _:
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
    return Column(
      children: [
        const MoviesListsTitleAndSeeAll(
          title: 'Most Popular',
        ),
        verticalSpace(12),
        const GeneralMoviesShimmerLoading(),
      ],
    );
  }

  Widget setupSuccess() {
    MoviesModel mostPopularMovies =
        localCache.getData(DataCacheKeys.mostPopularMovies);
    return Column(
      children: [
        MoviesListsTitleAndSeeAll(
          title: 'Most Popular',
          movies: mostPopularMovies.movies,
        ),
        verticalSpace(16),
        GeneralMoviesListView(
          movies: mostPopularMovies.movies!,
        ),
      ],
    );
  }

  Widget setupError(String errorMessage, double screenWidth) {
    return Column(
      children: [
        const MoviesListsTitleAndSeeAll(
          title: 'Most Popular',
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
