import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralMoviesListView extends StatelessWidget {
  const GeneralMoviesListView({super.key, required this.movies});
  final List<Results> movies;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.0.w),
      height: 260.h,
      child: ListView.builder(
        itemCount: 10,
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
