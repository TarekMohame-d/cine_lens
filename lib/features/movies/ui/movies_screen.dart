import 'package:cine_rank/features/movies/logic/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/custom_search_bar.dart';
import 'package:cine_rank/features/movies/ui/widgets/normal_movies_screen.dart';
import 'package:cine_rank/features/movies/ui/widgets/search_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) => current is MoviesSearch,
      builder: (context, state) {
        var cubit = context.read<MoviesCubit>();
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomSearchBar(),
            ),
            SliverFillRemaining(
              child: cubit.searchText.isEmpty
                  ? const NormalMoviesScreen()
                  : const SearchMoviesScreen(),
            ),
          ],
        );
      },
    );
  }
}
