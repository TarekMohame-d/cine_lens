import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_category_and_see_all.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_error_widget.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_list_view.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/spacing.dart';

class MostPopularMoviesBlocBuilder extends StatelessWidget {
  const MostPopularMoviesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<MoviesCubit>().getMostPopularMovies();

    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetMostPopularMoviesLoading ||
          current is GetMostPopularMoviesSuccess ||
          current is GetMostPopularMoviesFailure,
      builder: (context, state) {
        switch (state) {
          case GetMostPopularMoviesSuccess _:
            return _setupSuccess(state.movies);
          case GetMostPopularMoviesFailure _:
            return MoviesErrorWidget(
              errorMessage: state.errorModel.statusMessage!,
              category: MoviesCategoriesEnum.mostPopular,
            );
          default:
            return _setupLoading();
        }
      },
    );
  }

  Widget _widgetOutline(Widget child, List<MovieEntity> movies) {
    return Column(
      children: [
        MoviesCategoryAndSeeAll(
          category: MoviesCategoriesEnum.mostPopular,
          movies: movies,
        ),
        verticalSpace(12),
        child,
      ],
    );
  }

  Widget _setupLoading() {
    return _widgetOutline(const MoviesShimmerLoading(), []);
  }

  Widget _setupSuccess(List<MovieEntity> movies) {
    return _widgetOutline(MoviesListView(movies: movies), movies);
  }
}
