import 'package:cine_rank/core/helpers/data_cache.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_list_view.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_shimmer_loading.dart';
import 'package:cine_rank/features/movies/ui/widgets/movies_lists_title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesBlocBuilder extends StatelessWidget {
  const TopRatedMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetTopRatedMoviesLoading ||
          current is GetTopRatedMoviesSuccess ||
          current is GetTopRatedMoviesFailure ||
          current is GetMoviesFromCache,
      builder: (context, state) {
        if (state is GetTopRatedMoviesLoading) {
          return setupLoading();
        } else if (state is GetTopRatedMoviesSuccess ||
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
          title: 'Top Rated',
        ),
        verticalSpace(12),
        const GeneralMoviesShimmerLoading(),
      ],
    );
  }

  Widget setupSuccess() {
    MoviesModel topRatedMovies =
        localCache.getData(DataCacheKeys.topRatedMovies);
    return Column(
      children: [
        MoviesListsTitleAndSeeAll(
          title: 'Top Rated',
          movies: topRatedMovies.movies,
        ),
        verticalSpace(16),
        GeneralMoviesListView(
          movies: topRatedMovies.movies!,
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
