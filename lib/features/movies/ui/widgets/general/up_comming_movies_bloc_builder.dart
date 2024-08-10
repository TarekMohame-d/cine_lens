import 'package:cine_rank/core/helpers/data_cache.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_list_view.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_shimmer_loading.dart';
import 'package:cine_rank/features/movies/ui/widgets/movies_lists_title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpCommingMoviesBlocBuilder extends StatelessWidget {
  const UpCommingMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetUpcomingMoviesLoading ||
          current is GetUpcomingMoviesSuccess ||
          current is GetUpcomingMoviesFailure ||
          current is GetMoviesFromCache,
      builder: (context, state) {
        switch (state) {
          case GetUpcomingMoviesLoading _:
            return setupLoading();
          case GetUpcomingMoviesSuccess _:
          case GetMoviesFromCache _:
            return setupSuccess();
          case GetUpcomingMoviesFailure _:
            return setupError(state.errorModel.statusMessage ?? 'Unknown error',
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
          title: 'Upcoming',
        ),
        verticalSpace(12),
        const GeneralMoviesShimmerLoading(),
      ],
    );
  }

  Widget setupSuccess() {
    MoviesModel upcomingMovies =
        localCache.getData(DataCacheKeys.upcomingMovies);
    return Column(
      children: [
        MoviesListsTitleAndSeeAll(
          title: 'Upcoming',
          movies: upcomingMovies.movies,
        ),
        verticalSpace(16),
        GeneralMoviesListView(
          movies: upcomingMovies.movies!,
        ),
      ],
    );
  }

  Widget setupError(String errorMessage, double screenWidth) {
    return Column(
      children: [
        const MoviesListsTitleAndSeeAll(
          title: 'Upcoming',
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
