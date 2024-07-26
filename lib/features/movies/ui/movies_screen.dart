import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_lists.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/now_playing_movies.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  static const List<String> titles = ['Most Popular', 'Top Rated', 'Upcoming'];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              return GeneralMoviesLists(
                title: titles[index],
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
