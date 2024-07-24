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
          current is MoviesGetNowPlayingSuccess ||
          current is MoviesGetNowPlayingLoading ||
          current is MoviesGetNowPlayingFailure,
      builder: (context, state) {
        if (state is MoviesGetNowPlayingLoading) {
          return setupLoading();
        } else if (state is MoviesGetNowPlayingSuccess) {
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
