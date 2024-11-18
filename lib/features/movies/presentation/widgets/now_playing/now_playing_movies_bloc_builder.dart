import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../movies_category_and_see_all.dart';
import 'custom_carousel_slider.dart';
import 'now_playing_shimmer_loading.dart';

class NowPlayingMoviesBlocBuilder extends StatelessWidget {
  const NowPlayingMoviesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<MoviesCubit>().getNowPlayingMovies();

    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetNowPlayingMoviesLoading ||
          current is GetNowPlayingMoviesSuccess ||
          current is GetNowPlayingMoviesFailure,
      builder: (context, state) {
        switch (state) {
          case GetNowPlayingMoviesSuccess _:
            return _setupSuccess(state.movies);
          case GetNowPlayingMoviesFailure _:
            return MoviesErrorWidget(
              errorMessage: state.errorModel.statusMessage!,
              category: MoviesCategoriesEnum.nowPlaying,
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
          category: MoviesCategoriesEnum.nowPlaying,
        ),
        verticalSpace(12),
        child,
      ],
    );
  }

  Widget _setupLoading() {
    return _widgetOutline(const NowPlayingShimmerLoading(), []);
  }

  Widget _setupSuccess(List<MovieEntity> movies) {
    return _widgetOutline(CustomCarouselSlider(movies: movies), movies);
  }
}
