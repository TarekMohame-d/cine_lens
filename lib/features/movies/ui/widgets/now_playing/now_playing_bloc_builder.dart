import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/custom_carousel_slider.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/now_playing_shimmer_loading.dart';
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
        bool dataLoaded = AppConstants.nowPlayingMovies != null;
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
    return const NowPlayingShimmerLoading();
  }

  Widget setupSuccess() {
    return const CustomCarouselSlider();
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
