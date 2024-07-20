import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/ui/widgets/movies_lists_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralMoviesLists extends StatelessWidget {
  const GeneralMoviesLists({super.key, required this.title});
  final String title;

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
          Container(
            margin: EdgeInsets.only(left: 24.0.w),
            height: 230.h,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 12.0.w),
                  height: 230.h,
                  width: 135.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
