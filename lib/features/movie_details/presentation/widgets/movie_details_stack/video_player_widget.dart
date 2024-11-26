import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movie_details/presentation/cubit/movies_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerWidget extends StatefulWidget {
  const YouTubePlayerWidget({super.key, required this.movieId});
  final int movieId;
  @override
  State<YouTubePlayerWidget> createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesDetailsCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
      child: Builder(builder: (context) {
        context.read<MoviesDetailsCubit>().getMovieVideos(widget.movieId);
        return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
          buildWhen: (previous, current) =>
              current is GetMovieVideosLoading ||
              current is GetMovieVideosSuccess ||
              current is GetMovieVideosFailure,
          builder: (context, state) {
            switch (state) {
              case GetMovieVideosSuccess _:
                _controller = YoutubePlayerController(
                  initialVideoId:
                      YoutubePlayer.convertUrlToId(state.videoLink) ?? '',
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                );
                return YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: KColors.white,
                  progressColors: const ProgressBarColors(
                    playedColor: KColors.white,
                    handleColor: KColors.blueAccent,
                  ),
                );
              case GetMovieVideosFailure _:
                return Center(child: Text(state.apiErrorModel.statusMessage!));
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        );
      }),
    );
  }
}
