import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_list_view.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return setupLoading();
        } else if (result.$2) {
          return setupSuccess(
            result.$1!,
          );
        } else {
          return setupError();
        }
      },
    );
  }

  Widget setupLoading() {
    return const GeneralMoviesShimmerLoading();
  }

  Widget setupSuccess(List<Results> movies) {
    return GeneralMoviesListView(
      movies: movies,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  (List<Results>?, bool) hasData(int index) {
    switch (index) {
      case 0:
        return (
          AppConstants.mostPopularMovies?.results,
          AppConstants.mostPopularMovies != null
        );
      case 1:
        return (
          AppConstants.topRatedMovies?.results,
          AppConstants.topRatedMovies != null
        );
      case 2:
        return (
          AppConstants.upcomingMovies?.results,
          AppConstants.upcomingMovies != null
        );
      default:
        return (null, false);
    }
  }
}
