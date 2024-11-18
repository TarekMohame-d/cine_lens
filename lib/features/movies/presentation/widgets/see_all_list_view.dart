import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'see_all_list_view_item.dart';

class SeeAllListView extends StatefulWidget {
  const SeeAllListView(
      {super.key, required this.category, required this.movies});
  final MoviesCategoriesEnum category;
  final List<MovieEntity> movies;

  @override
  State<SeeAllListView> createState() => _SeeAllListViewState();
}

class _SeeAllListViewState extends State<SeeAllListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Scroll listener
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        await context.read<MoviesCubit>().getMoreMovies(widget.category, true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return SeeAllListViewItem(
          movie: widget.movies[index],
        );
      },
    );
  }
}
