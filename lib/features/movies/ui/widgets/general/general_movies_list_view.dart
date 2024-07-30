import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/movies_model.dart';
import 'general_movies_list_view_item.dart';

class GeneralMoviesListView extends StatelessWidget {
  const GeneralMoviesListView({super.key, required this.movies});
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.0.w),
      height: 260.h,
      child: ListView.builder(
        itemCount: movies.length > 10 ? 10 : movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GeneralMoviesListViewItem(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
