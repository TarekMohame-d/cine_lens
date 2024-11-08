import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/text_styles.dart';

class MoviesDetailsOverview extends StatelessWidget {
  const MoviesDetailsOverview({super.key, required this.overview});
  final String overview;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: KTextStyles.font16WhiteSemiBold.copyWith(height: 1.5.h),
          ),
          Text(
            overview,
            style: KTextStyles.font14WhiteMedium,
          ),
        ],
      ),
    );
  }
}
