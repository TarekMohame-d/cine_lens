import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesDetailsOverview extends StatelessWidget {
  const MoviesDetailsOverview({super.key, required this.overview});
  final String overview;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0.w,
        vertical: 20.0.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: AppTextStyles.font16WhiteSemiBold.copyWith(height: 1.5.h),
          ),
          Text(
            overview,
            style: AppTextStyles.font14WhiteMedium,
          ),
        ],
      ),
    );
  }
}
