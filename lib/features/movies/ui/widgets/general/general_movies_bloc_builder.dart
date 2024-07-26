import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_list_view.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_shimmer_loading.dart';
import 'package:cine_rank/features/movies/ui/widgets/movies_lists_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesListsHeader(
            title: title,
          ),
          verticalSpace(12),
          const GeneralMoviesShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(List<Movie> movies, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesListsHeader(
            title: title,
          ),
          verticalSpace(12),
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
        return (
          AppConstants.mostPopularMovies?.movies,
          AppConstants.mostPopularMovies != null,
          'Most Popular'
        );
      case 1:
        return (
          AppConstants.topRatedMovies?.movies,
          AppConstants.topRatedMovies != null,
          'Top Rated'
        );
      case 2:
        return (
          AppConstants.upcomingMovies?.movies,
          AppConstants.upcomingMovies != null,
          'Upcoming'
        );
      default:
        return (null, false, '');
    }
  }
}
