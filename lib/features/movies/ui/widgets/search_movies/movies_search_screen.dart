import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/logic/movies_search_cubit/movies_search_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/custom_app_bar.dart';
import 'package:cine_rank/features/movies/ui/widgets/search_movies/search_movies_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesSearchScreen extends StatelessWidget {
  const MoviesSearchScreen({super.key});
  // todo: make moves search bloc
  // todo: make moves search repo
  // todo: finish movies search screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              onChanged: (value) {
                context
                    .read<MoviesSearchCubit>()
                    .getSearchMovies(query: value, page: 1);
              },
            ),
            verticalSpace(12),
            const Expanded(child: SearchMoviesBlocBuilder()),
          ],
        ),
      ),
    );
  }
}
