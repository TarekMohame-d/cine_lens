import '../../../core/helpers/spacing.dart';
import '../../../core/themes/app_colors.dart';
import '../logic/movies_cubit.dart';
import 'widgets/general/general_movies_bloc_builder.dart';
import 'widgets/now_playing/now_playing_bloc_builder.dart';
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
            child: NowPlayingBlocBuilder(),
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
