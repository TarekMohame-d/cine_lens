import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'movies_list_view_item.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key, required this.movies});
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        itemCount: movies.length > 10 ? 10 : movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MoviesListViewItem(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
