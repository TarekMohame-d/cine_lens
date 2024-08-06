import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (state is GetMostPopularMoviesLoading) {
          return setupLoading();
        } else if (state is GetMostPopularMoviesSuccess ||
            state is GetMoviesFromCache) {
          return setupSuccess();
        } else {
          return setupError();
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

  Widget setupError() {
    return const Center(
      child: Text('Something went wrong'),
    );
  }
}
