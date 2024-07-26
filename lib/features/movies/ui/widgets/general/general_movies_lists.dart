import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/ui/widgets/general/general_movies_bloc_builder.dart';
import 'package:cine_rank/features/movies/ui/widgets/movies_lists_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralMoviesLists extends StatelessWidget {
  const GeneralMoviesLists(
      {super.key, required this.title, required this.index});
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesListsHeader(
            title: title,
          ),
          verticalSpace(12),
          GeneralMoviesBlocBuilder(
            index: index,
          ),
        ],
      ),
    );
  }
}
