import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
import 'package:cine_rank/core/widgets/custom_snack_bar.dart';
import 'package:cine_rank/core/widgets/text_button.dart';
import 'package:cine_rank/features/movie_details/presentation/cubit/movies_details_cubit.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/movie_details_stack/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsButtonsRow extends StatefulWidget {
  const MovieDetailsButtonsRow({
    super.key,
    required this.movieId,
    required this.movieLink,
  });

  final int movieId;
  final String movieLink;

  @override
  State<MovieDetailsButtonsRow> createState() => _MovieDetailsButtonsRowState();
}

class _MovieDetailsButtonsRowState extends State<MovieDetailsButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KTextButton(
            onPressed: () async {
              await _showTrailerDialog(context, widget.movieId);
            },
            backgroundColor: KColors.blueAccent,
            borderRadius: 32,
            buttonWidth: 115.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.play_arrow_rounded,
                  color: KColors.white,
                ),
                horizontalSpace(8),
                Text(
                  'Trailer',
                  style: KTextStyles.font16WhiteMedium,
                ),
              ],
            ),
          ),
          horizontalSpace(16),
          InkWell(
            onTap: () async {
              final String url = await context
                  .read<MoviesDetailsCubit>()
                  .getMovieWatchProviders(widget.movieId);
              if (mounted) {
                if (url.length > 'https://www.themoviedb'.length) {
                  context.pushNamed(KRoutes.movieWebScreen, arguments: url);
                } else {
                  customSnackBar(
                    context,
                    'No Providers Available right now',
                    Duration(milliseconds: 600),
                  );
                }
              }
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 48.0.w,
              height: 48.0.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: KColors.soft,
              ),
              child: const Icon(
                Icons.cast,
                color: KColors.blueAccent,
              ),
            ),
          ),
          horizontalSpace(16),
          InkWell(
            onTap: () {
              if (!widget.movieLink.isNullOrEmpty()) {
                context.pushNamed(
                  KRoutes.movieWebScreen,
                  arguments: widget.movieLink,
                );
              } else {
                customSnackBar(
                  context,
                  'No Website Available right now',
                  Duration(milliseconds: 600),
                );
              }
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 48.0.w,
              height: 48.0.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: KColors.soft,
              ),
              child: const Icon(
                Icons.open_in_new_rounded,
                color: KColors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showTrailerDialog(BuildContext context, int movieId) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          child: YouTubePlayerWidget(
            movieId: movieId,
          ),
        );
      },
    ).then((_) {
      // Reset orientation when dialog is dismissed
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    });
  }
}
