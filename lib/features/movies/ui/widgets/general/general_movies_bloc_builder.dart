import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/data_cache.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/movies_model.dart';
import '../../../logic/movies_cubit.dart';
import '../movies_lists_header.dart';
import 'general_movies_list_view.dart';
import 'general_movies_shimmer_loading.dart';

class GeneralMoviesBlocBuilder extends StatelessWidget {
  const GeneralMoviesBlocBuilder({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetMoviesLoading ||
          current is GetMoviesSuccess ||
          current is GetMoviesFailure,
      builder: (context, state) {
        var result = hasData(index);
        if (state is GetMoviesLoading) {
          return setupLoading(result.$3);
        } else if (result.$2) {
          return setupSuccess(
            result.$1!,
            result.$3,
          );
        } else {
          return setupError();
        }
      },
    );
  }

  Widget setupLoading(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: index == 2 ? 0 : 28.0.h),
      child: Column(
        children: [
          MoviesListsHeader(
            title: title,
            movies: const [],
          ),
          verticalSpace(12),
          const GeneralMoviesShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(List<Movie> movies, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: index == 2 ? 0 : 28.0.h),
      child: Column(
        children: [
          MoviesListsHeader(
            title: title,
            dataLoaded: true,
            movies: movies,
          ),
          verticalSpace(16),
          GeneralMoviesListView(
            movies: movies,
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  (List<Movie>?, bool, String) hasData(int index) {
    switch (index) {
      case 0:
        MoviesModel? mostPopularMovies =
            cache.getData(DataCacheKeys.mostPopularMovies);
        return (
          mostPopularMovies?.movies,
          mostPopularMovies != null,
          'Most Popular'
        );
      case 1:
        MoviesModel? topRatedMovies =
            cache.getData(DataCacheKeys.topRatedMovies);
        return (topRatedMovies?.movies, topRatedMovies != null, 'Top Rated');
      case 2:
        MoviesModel? upcomingMovies =
            cache.getData(DataCacheKeys.upcomingMovies);
        return (upcomingMovies?.movies, upcomingMovies != null, 'Upcoming');
      default:
        return (null, false, '');
    }
  }
}
