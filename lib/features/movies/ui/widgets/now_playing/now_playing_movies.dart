import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/ui/widgets/movies_lists_header.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/now_playing_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MoviesListsHeader(
          title: 'Now Playing',
        ),
        verticalSpace(12),
        SizedBox(
          height: 240.h,
          child: const NowPlayingBlocBuilder(),
        ),
      ],
    );
  }
}
