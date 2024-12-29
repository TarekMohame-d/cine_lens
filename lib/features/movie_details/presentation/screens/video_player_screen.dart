import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movie_details/presentation/cubit/movies_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.movieId});
  final int movieId;
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late String? videoId;
  bool _isFullscreen = false;

  @override
  void initState() {
    super.initState();
    context
        .read<MoviesDetailsCubit>()
        .getMovieVideos(widget.movieId)
        .then((value) {
      if (!value.isNullOrEmpty()) {
        videoId = YoutubePlayer.convertUrlToId(value);
        if (!videoId.isNullOrEmpty()) {
          _controller = YoutubePlayerController(
            initialVideoId: videoId!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
            ),
          );
          _controller.addListener(() {
            setState(() {
              _isFullscreen = _controller.value.isFullScreen;
            });
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _restoreSystemUiSettings();
    super.dispose();
  }

  void _restoreSystemUiSettings() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullscreen
          ? null // Hide AppBar in fullscreen mode
          : AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Center(
            child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
              buildWhen: (previous, current) =>
                  current is GetMovieVideosLoading ||
                  current is GetMovieVideosSuccess ||
                  current is GetMovieVideosFailure,
              builder: (context, state) {
                switch (state) {
                  case GetMovieVideosSuccess _:
                    return YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: _controller,
                        progressColors: const ProgressBarColors(
                          playedColor: KColors.white,
                          handleColor: KColors.blueAccent,
                          bufferedColor: KColors.grey,
                        ),
                        thumbnail: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0.r),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://img.youtube.com/vi/$videoId/0.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      builder: (context, player) {
                        return player;
                      },
                    );
                  case GetMovieVideosFailure _:
                    return Center(
                        child: Text(state.apiErrorModel.statusMessage!));
                  default:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: KColors.blueAccent,
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
