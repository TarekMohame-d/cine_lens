import '../../../../../core/helpers/data_cache.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../logic/movies_cubit.dart';
import '../movies_lists_header.dart';
import 'custom_carousel_slider.dart';
import 'now_playing_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingBlocBuilder extends StatelessWidget {
  const NowPlayingBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) =>
          current is GetMoviesLoading ||
          current is GetMoviesSuccess ||
          current is GetMoviesFailure,
      builder: (context, state) {
        var nowPlayingMovies = cache.getData(DataCacheKeys.nowPlayingMovies);
        bool dataLoaded = nowPlayingMovies != null;
        if (state is GetMoviesLoading) {
          return setupLoading();
        } else if (dataLoaded) {
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
        const MoviesListsHeader(
          title: 'Now Playing',
        ),
        verticalSpace(12),
        const NowPlayingShimmerLoading(),
      ],
    );
  }

  Widget setupSuccess() {
    return Column(
      children: [
        const MoviesListsHeader(
          title: 'Now Playing',
          dataLoaded: true,
        ),
        verticalSpace(12),
        const CustomCarouselSlider(),
      ],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
