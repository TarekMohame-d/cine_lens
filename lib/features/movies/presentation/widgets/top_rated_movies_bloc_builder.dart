import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit/movies_cubit.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_category_and_see_all.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_error_widget.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_list_view.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesBlocBuilder extends StatelessWidget {
  const TopRatedMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MoviesCubit>().getTopRatedMovies();

    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetTopRatedMoviesLoading ||
          current is GetTopRatedMoviesSuccess ||
          current is GetTopRatedMoviesFailure,
      builder: (context, state) {
        switch (state) {
          case GetTopRatedMoviesSuccess _:
            return _setupSuccess(state.movies);
          case GetTopRatedMoviesFailure _:
            return MoviesErrorWidget(
              errorMessage: state.errorModel.statusMessage!,
              category: 'Top Rated',
            );
          default:
            return _setupLoading();
        }
      },
    );
  }

  Widget _widgetOutline(Widget child) {
    return Column(
      children: [
        const MoviesCategoryAndSeeAll(
          category: 'Top Rated',
        ),
        verticalSpace(12),
        child,
      ],
    );
  }

  Widget _setupLoading() {
    return _widgetOutline(const MoviesShimmerLoading());
  }

  Widget _setupSuccess(List<MovieEntity> movies) {
    return _widgetOutline(MoviesListView(movies: movies));
  }
}
