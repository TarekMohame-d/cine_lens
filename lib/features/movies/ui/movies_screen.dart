import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/now_playing_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<MoviesCubit>().getMovies(wantToRefresh: true);
      },
      color: AppColors.blueAccent,
      backgroundColor: AppColors.soft,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: verticalSpace(24),
          ),
          const SliverToBoxAdapter(
            child: NowPlayingMovies(),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(24),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 3,
              (context, index) {
                return GeneralMoviesBlocBuilder(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
